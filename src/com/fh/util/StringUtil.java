package com.fh.util;
/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	//将 'id1,id2,id3,...' 转为 'id1','id2','id3',...
	public static String getIds(String ids){
		String sf_id = "";
		String[] idsarr = ids.split(",");
		for(int i=0;i<idsarr.length;i++){
			sf_id+="'"+idsarr[i]+"',";
		}
		return sf_id.substring(0,sf_id.length()-1);
	}
}
