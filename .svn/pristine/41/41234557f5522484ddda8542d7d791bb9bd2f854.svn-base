package com.thinkgem.jeesite.modules.oa.web.mytask.utis;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Timer;
import java.util.TimerTask;

/*
 *  选择重复周期定时器
 * 
 * **/
public class RepeatTimeru extends TimerTask {

	
	public static void main(String[] args) {
		Timer timer = new Timer();
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			timer.schedule(new RepeatTimeru(), sfd.parse("2016-12-09 21:00:00"), 2000);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		System.out.println("A");
		
	}
	
	
	
}
