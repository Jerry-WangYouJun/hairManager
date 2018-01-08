package com.hair.model;

import java.io.UnsupportedEncodingException;

public class Infomation {
	private Integer id;
	private String about_us;
	private String wholesale;
	private String order;
	private String acceptable;
	private String shipping;
	private String contact;

	private String paypal_email;
	private String first_name;
	private String last_name;
	private String city;
	private String state;
	private String country;
	private String tel;
	private String bank;
	private String bank_address;
	private String beneficiary_name;
	private String beneficiary_no;
	private String beneficiary_address;
	private String postal_code;
	private String office_phone;
	private String whole_address;
	private String zip_code;
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAbout_us() {
		
		return about_us;
	}

	public void setAbout_us(String about_us) {
		try {
			this.about_us = new String(about_us.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public String getWholesale() {
		return wholesale;
	}

	public void setWholesale(String wholesale) {
		try {
			this.wholesale = new String(wholesale.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		try {
			this.order = new String(order.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getAcceptable() {
		return acceptable;
	}

	public void setAcceptable(String acceptable) {
		try {
			this.acceptable = new String(acceptable.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		try {
			this.contact = new String(contact.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getPaypal_email() {
		return paypal_email;
	}

	public void setPaypal_email(String paypal_email) {
		this.paypal_email = paypal_email;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBank_address() {
		return bank_address;
	}

	public void setBank_address(String bank_address) {
		this.bank_address = bank_address;
	}

	public String getBeneficiary_name() {
		return beneficiary_name;
	}

	public void setBeneficiary_name(String beneficiary_name) {
		this.beneficiary_name = beneficiary_name;
	}

	public String getBeneficiary_no() {
		return beneficiary_no;
	}

	public void setBeneficiary_no(String beneficiary_no) {
		this.beneficiary_no = beneficiary_no;
	}

	public String getBeneficiary_address() {
		return beneficiary_address;
	}

	public void setBeneficiary_address(String beneficiary_address) {
		this.beneficiary_address = beneficiary_address;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public String getOffice_phone() {
		return office_phone;
	}

	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}

	public String getWhole_address() {
		return whole_address;
	}

	public void setWhole_address(String whole_address) {
		this.whole_address = whole_address;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShipping() {
		return shipping;
	}

	public void setShipping(String shipping) {
		this.shipping = shipping;
	}

}
