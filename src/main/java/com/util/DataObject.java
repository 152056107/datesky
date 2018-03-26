package com.util;

import java.util.Date;
import java.util.List;

public class DataObject {
	 private String id;
	    private List<UserData> data;
	    private String mmac;
	    private String rate;
	    private String time;
	    private String lat;
	    private String lon;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public List<UserData> getData() {
			return data;
		}
		public void setData(List<UserData> data) {
			this.data = data;
		}
		public String getMmac() {
			return mmac;
		}
		public void setMmac(String mmac) {
			this.mmac = mmac;
		}
		public String getRate() {
			return rate;
		}
		public void setRate(String rate) {
			this.rate = rate;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getLat() {
			return lat;
		}
		public void setLat(String lat) {
			this.lat = lat;
		}
		public String getLon() {
			return lon;
		}
		public void setLon(String lon) {
			this.lon = lon;
		}
	    
	
	
}
