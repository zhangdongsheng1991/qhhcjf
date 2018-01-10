package com.fh.util;

public class UtilCheckPcOrPhone {
	
	public static boolean pcOrPhone(String requestHeader){
		String[]deviceArray = new String[]{"android","mac os","windows phone"};
		if(requestHeader == null)
			return false;
		requestHeader = requestHeader.toLowerCase();
		for(int i=0;i<deviceArray.length;i++){
			if(requestHeader.indexOf(deviceArray[i])>0){
				return true;
			}
		}
		return false;
	}
}
