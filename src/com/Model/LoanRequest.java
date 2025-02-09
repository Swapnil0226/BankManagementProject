package com.Model;

public class LoanRequest {
	
	private int loanId;
	private int cid;
	private String cName;
	private String email;
	private String contact;
	private double loanAmount;
	private int loanDuration;
	private String loanStatus;
	private String comment;
	private String applicationDate;
	
	public int getLoanId() {
		return loanId;
	}
	public void setLoanId(int loanId) {
		this.loanId = loanId;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public double getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(double loanAmount) {
		this.loanAmount = loanAmount;
	}
	public int getLoanDuration() {
		return loanDuration;
	}
	public void setLoanDuration(int loanDuration) {
		this.loanDuration = loanDuration;
	}
	@Override
	public String toString() {
		return "LoanRequest [loanId=" + loanId + ", cid=" + cid + ", cName=" + cName + ", email=" + email + ", contact="
				+ contact + ", loanAmount=" + loanAmount + ", loanDuration=" + loanDuration + "]";
	}
	public LoanRequest(int loanId, int cid, String cName, String email, String contact, double loanAmount,
			int loanDuration , String loanStatus , String comment, String applicationDate) {
		super();
		this.loanId = loanId;
		this.cid = cid;
		this.cName = cName;
		this.email = email;
		this.contact = contact;
		this.loanAmount = loanAmount;
		this.loanDuration = loanDuration;
		this.loanStatus = loanStatus;
		this.comment = comment;
		this.applicationDate = applicationDate;
	}
	public LoanRequest(int loanId, int cid, String cName, String email, String contact, double loanAmount,
			int loanDuration , String loanStatus , String applicationDate) {
		super();
		this.loanId = loanId;
		this.cid = cid;
		this.cName = cName;
		this.email = email;
		this.contact = contact;
		this.loanAmount = loanAmount;
		this.loanDuration = loanDuration;
		this.loanStatus = loanStatus;
		this.applicationDate = applicationDate;
	}
	public String getLoanStatus() {
		return loanStatus;
	}
	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	
	
}
