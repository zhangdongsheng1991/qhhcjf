package com.fh.controller.web;

import com.fh.controller.base.BaseController;
import com.fh.service.system.usermanagement.UserManageMentService;

public class ForgetPwdThread  extends BaseController implements Runnable{
	private String id;
	private String phone;
	private String k;
	private String type;
	private UserManageMentService usermanagementService;
	
	public ForgetPwdThread(String type,String id,String k,String phone,UserManageMentService usermanagementService){
		this.id = id;
		this.phone = phone;
		this.usermanagementService = usermanagementService;
		this.k = k;
		this.type = type;
	}
	@Override
	public void run() {
		try {
			System.out.println(usermanagementService);
			Thread.sleep(30000);
			System.out.println("id==================================="+id);
			System.out.println("phone==================================="+phone);
			if("findpwd".equals(type)){	
				usermanagementService.updateTempId(id,phone);
			}else if(("resetPassword").equals(type)){
				usermanagementService.updateTempId2(id,phone);
			}
			WebLoginController.map.remove(k);
			System.out.println("ffffffffffffffffff");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
	}

}
