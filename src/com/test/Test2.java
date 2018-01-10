package com.test;

import java.util.HashMap;
import java.util.Map;

public class Test2 extends Thread{
	private String name;     
    private Object prev;     
    private Object self;     
	    
    private Test2(String name, Object prev, Object self) {     
        this.name = name;     
        this.prev = prev;     
        this.self = self;     
    }
    @Override    
    public void run() {     
        int count = 10;     
        while (count > 0) {     
            synchronized (prev) {     
                synchronized (self) {     
                    System.out.print(name);     
                    count--;    
                      
                    self.notify();     
                }     
                try {     
                    prev.wait();     
                } catch (InterruptedException e) {     
                    e.printStackTrace();     
                }     
            }     
    
        }     
    }  
	
	public static void main(String[] args) throws InterruptedException {
		Object a = new Object();     
        Object b = new Object();     
        Object c = new Object();     
        Test2 pa = new Test2("A", c, a);     
        Test2 pb = new Test2("B", a, b);     
        Test2 pc = new Test2("C", b, c);     
             
        pa.start();  
        Thread.sleep(100);  //确保按顺序A、B、C执行  
        pb.start();  
        Thread.sleep(100);    
        pc.start();     
        Thread.sleep(100);   
	}
}
