package com.Model;

public class Customer {

	private String password;
	private int cid;
	private String accNumber;
	private String cname;
	private int age;
	private float accountBalance;
	private String gender;
	private String city;
	private String atype;

	public String getAccNumber() {
		return accNumber;
	}
	
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(float accountBalance) {
		this.accountBalance = accountBalance;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public Customer(int cid, String cname, int age, float accountBalance, String gender, String city, String atype) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.age = age;
		this.accountBalance = accountBalance;
		this.gender = gender;
		this.city = city;
		this.atype = atype;
	}

	public Customer(int cid, String cname, int age, float accountBalance, String gender, String city, String atype,
			String password,String accNumber) {
		super();

		this.cid = cid;
		this.cname = cname;
		this.age = age;
		this.accountBalance = accountBalance;
		this.gender = gender;
		this.city = city;
		this.atype = atype;
		this.password = password;
		this.accNumber=accNumber;
	}

	@Override
	public String toString() {
		return "Customer [password=" + password + ", cid=" + cid + ", accNumber=" + accNumber + ", cname=" + cname
				+ ", age=" + age + ", accountBalance=" + accountBalance + ", gender=" + gender + ", city=" + city
				+ ", atype=" + atype + "]";
	}
	
}