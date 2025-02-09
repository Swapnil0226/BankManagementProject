package com.Model;

public class Employee {

	private String name;
	private String email;
	private String password;
	private String role;
	private String empId;
	private String address;
	private String contactNumber;

	// Constructor
	public Employee(String name, String email, String password, String role, String empId, String address,
			String contactNumber) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.empId = empId;
		this.address = address;
		this.contactNumber = contactNumber;
	}

	// Getter and Setter methods
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Override
	public String toString() {
		return "Employee [name=" + name + ", email=" + email + ", password=" + password + ", role=" + role + ", empId="
				+ empId + ", address=" + address + ", contactNumber=" + contactNumber + "]";
	}
}
