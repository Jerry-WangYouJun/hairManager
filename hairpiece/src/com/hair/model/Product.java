package com.hair.model;

import java.util.List;

import com.hair.common.CodeUtil;

public class Product {
	  private  Integer id ; 
	  private String proName;
	  private String type ; 
	  private String subType ; 
	  private String hairType ;
	  private String permed;
	  private String grade ;
	  private String texture ;
	  private Double unit;
	  private String items;
	  private String hairLen;
	  private String hairColor ;
	  private String remark;
	  private String hotsale;
	  private List<Image> imageList;
	
	  public void getUtf() {
		  proName= CodeUtil.utfStr(proName);
		  type =CodeUtil.utfStr(type);
		  subType = CodeUtil.utfStr(subType);
		  hairType =CodeUtil.utfStr(hairType);
		  grade = CodeUtil.utfStr(grade);
		  texture= CodeUtil.utfStr(texture);
		  hairColor = CodeUtil.utfStr(hairColor);
		  remark =CodeUtil.utfStr(remark);
	  }
	  
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}
	public String getHairType() {
		return hairType;
	}
	public void setHairType(String hairType) {
		this.hairType = hairType;
	}
	public String getPermed() {
		return permed;
	}
	public void setPermed(String permed) {
		this.permed = permed;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTexture() {
		return texture;
	}
	public void setTexture(String texture) {
		this.texture = texture;
	}
	public Double getUnit() {
		return unit;
	}
	public void setUnit(Double unit) {
		this.unit = unit;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getHairLen() {
		return hairLen;
	}
	public void setHairLen(String hairLen) {
		this.hairLen = hairLen;
	}
	public String getHairColor() {
		return hairColor;
	}
	public void setHairColor(String hairColor) {
		this.hairColor = hairColor;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getHotsale() {
		return hotsale;
	}
	public void setHotsale(String hotsale) {
		this.hotsale = hotsale;
	}
	public List<Image> getImageList() {
		return imageList;
	}
	public void setImageList(List<Image> imageList) {
		this.imageList = imageList;
	}
}
