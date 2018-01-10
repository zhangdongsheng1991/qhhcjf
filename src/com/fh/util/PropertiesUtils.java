package com.fh.util;


import java.net.MalformedURLException;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * Properties工具类
 */
public class PropertiesUtils {
	
	private static ResourceBundle res = ResourceBundle.getBundle("config");
	private static 	Map<String,String> urlsMap = null;
	
	/**
	 * 获取urlMap
	 * @return
	 */
	public static Map<String,String> getUrlMap(){
		if(urlsMap != null && !urlsMap.isEmpty()){
			return urlsMap;
		}
		urlsMap= new HashMap<String, String>();
		Enumeration e = res.getKeys();
		while(e.hasMoreElements()){
			String key = e.nextElement().toString();
			String value = get(key);
			urlsMap.put(key, value);
//			System.out.println(key+"-ms---"+value);
		}
		return urlsMap;
	}
	
	
	public static String get(String key){
		return res.getString(key);
	}
	
	
	public static String getReqUri(String reqUrl){
		try {
			URL url  = new URL(reqUrl);
//			System.out.println("getAuthority = "+url.getAuthority());
//			System.out.println("getDefaultPort = "+url.getDefaultPort());
//			System.out.println("getFile = "+url.getFile());
//			System.out.println("getHost"+ " = "+url.getHost());
//			System.out.println("getPath"+ " = "+url.getPath());
//			System.out.println("getPort"+ " = "+url.getPort());
//			System.out.println("getProtocol"+ " = "+url.getProtocol());
//			System.out.println("getQuery"+ " = "+url.getQuery());
//			System.out.println("getRef"+ " = "+url.getRef());
//			System.out.println("getUserInfo"+ " = "+url.getUserInfo());
			return url.getPath();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	public static void main(String[] args)
	{
		System.out.print(PropertiesUtils.getUrlMap().get("userloginlog.properties"));
	}
	
	
}
