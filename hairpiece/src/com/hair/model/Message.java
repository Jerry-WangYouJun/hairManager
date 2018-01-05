package com.hair.model;

public class Message {
	 private Integer id ; 
	 private Integer contect ; 
	 private String  name;
	 private String msg;
	 private String status;
	 private String  time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getContect() {
		return contect;
	}
	public void setContect(Integer contect) {
		this.contect = contect;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	 
}
