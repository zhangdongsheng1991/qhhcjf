package com.fh.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.OperationRecords;
import com.fh.entity.system.UserLoginLog;
import com.fh.service.system.product.AppProductService;
import com.fh.service.system.product.AppProductStableService;
import com.fh.service.system.usermanagement.usermanagement.userlog.UserLoginLogService;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;

@Component("userLoginLog")
@Aspect
public class UserLoginLogAOP extends BaseController{
	@Resource(name="userloginlogService")
	private UserLoginLogService userloginlogService;
	
	@Resource(name="productService")
	private AppProductService appproductService;
	
	@Resource(name="productStableService")
	private AppProductStableService appProductStableService;
	
	@Pointcut("within(com.fh.controller.web..*)")
	public void userLoginLogPointcut(){
		
	}
	
	@Around("userLoginLogPointcut()")
	public Object userLoginLog(ProceedingJoinPoint pjp) throws Throwable{
		Object obj = pjp.proceed();
		String comment = "";
		String productid="";
		UserLoginLog userloginlog = (UserLoginLog) getRequest().getSession().getAttribute(Const.SESSIONWEB_USERLOGINLOG);
		if(userloginlog!=null){
			//获取方法名
			Signature signature = pjp.getSignature();
			String methodName = signature.getName();
			if(methodName.equals("auth")||methodName.equals("getSelfMessagesCount")){
				return obj;
			}
			//查看产品
			if(methodName.equals("goProductInfo")||methodName.equals("cpyy")){
				PageData pd = this.getPageData();
				PageData info = new PageData();
				String type ="";
				if(methodName.equals("goProductInfo")){
					type = pd.getString("PRODUCTTYPE");
				}else{
					type = pd.getString("TYPE");
					pd.put("ID", pd.get("PRODUCTID"));
				}
				switch (type) {
				case "1":
					info = appproductService.findById(pd);
					info.put("PRODUCTTYPE", "1");
					break;
				case "2":
					info = appProductStableService.findById(pd);
					info.put("PRODUCTTYPE", "2");
					break;
				default:
					info = appproductService.findById(pd);
					info.put("PRODUCTTYPE", "1");
					if(info!=null){
						break;
					}else{
						info = appProductStableService.findById(pd);
						info.put("PRODUCTTYPE", "2");
					}
				}
				comment = info.getString("PRODUCTREFERRED");
				String jsonProudct = "{'ID':'"+info.getString("ID")+"','PRODUCTTYPE':'"+info.getString("PRODUCTTYPE")+"',"
						+ "'PRODUCTREFERRED':'"+info.getString("PRODUCTREFERRED")+"','THEISSUERNAME':'"+info.getString("THEISSUERNAME")+"',"
								+ "'THEISSUERIMGURL':'"+info.getString("THEISSUERIMGURL")+"','TYPE':'"+info.getString("TYPE")+"','DATE':'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"'}";
				comment += "]]]"+jsonProudct;
			    productid = info.getString("ID");
			}
			
			//获取类名
			Object thisobj =  pjp.getTarget();
			Class clazz = thisobj.getClass();
			String clazzName = clazz.getName();
			
			
			
			//获取参数名称和值  
			Object[] args = pjp.getArgs();
			System.out.println(getRequest().getContextPath());
			//PropertiesUtils.getInstance();
			//获取数据
			String id = get32UUID();
			//String operate = PropertiesUtils.getVal(clazzName+"."+methodName);
			Date operating_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Tools.date2Str(new Date()));
			String operation_staff =  userloginlog.getU_phone();
			Integer logincount = userloginlog.getLogincount();
			//填写 OperationRecords
			OperationRecords records = new OperationRecords();
			records.setId(id);
			records.setOperation_staff(operation_staff);
			records.setOperating_time(operating_time);
			//records.setOperate(operate);
			records.setLogincount(logincount);
			records.setComment(comment);
			records.setProductid(productid);
			userloginlogService.addOperationRecords(records);
			System.out.println("执行了"+clazzName+"的"+methodName+"方法++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			
			HttpServletRequest request = getRequest();
			request.getRemoteAddr();
		}
		return obj;
	}
}
