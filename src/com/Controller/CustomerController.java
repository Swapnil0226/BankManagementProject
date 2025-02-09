package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.CustomerDAO;
import com.Helper.DBHelper;
import com.Model.Customer;

@WebServlet(urlPatterns = { "/cregister", "/cupdate", "/cget", "/cdelete" })
public class CustomerController extends HttpServlet {

	private CustomerDAO customerDAO;

	public CustomerController() {
		super();
		this.customerDAO = new CustomerDAO();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		System.out.println(action);
		try {
			HttpSession session = req.getSession();
			if (action != null) {

				// TODO Update:
				if (action.equalsIgnoreCase("update")) {
					int id = Integer.parseInt(req.getParameter("id"));
					Customer customer = this.customerDAO.get(id);

					session.setAttribute("customer", customer);

					System.out.println(customer);

					// redirect to the update page
					resp.sendRedirect("Cupdate.jsp");
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(req.getParameter("id"));
					Customer customer = this.customerDAO.get(id);

					session.setAttribute("customer", customer);

					System.out.println(customer);

					// redirect to the delete page
					resp.sendRedirect("Cdelete.jsp");
				} else {
					resp.sendRedirect("Cview.jsp");
				}

			} else {

				List<Customer> customers = this.customerDAO.get();
				Collections.sort(customers, (o1, o2) -> o1.getCid() - o2.getCid());

				session.setAttribute("customers", customers);
				resp.sendRedirect("Cview.jsp");
			}

		} catch (SQLException | ClassNotFoundException ex) {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println();
		try {
			if (action.equalsIgnoreCase("cregister")) {

				PrintWriter out = response.getWriter();
				// out.print("Working");

				int cid = (int) Math.floor(1000000 + Math.random() * 9000000);
				long accNumber = (long) Math.floor(Math.random() * 1_000_000_000_000L);
				String customerName = request.getParameter("cname");
				// int age = Integer.parseInt(request.getParameter("age"));
				String accNum=String.valueOf(accNumber);
				String password = String.valueOf(cid);
				String dob = request.getParameter("dob");
				System.out.println(dob);
				LocalDate dob1 = LocalDate.parse(dob);
				LocalDate curDate = LocalDate.now();
				int age = Period.between(dob1, curDate).getYears();
				System.out.println(age);
				float accountBalance = Float.parseFloat(request.getParameter("accountBalance"));
				String gender = request.getParameter("gender");
				String city = request.getParameter("city");
				String atype = request.getParameter("atype");
				Customer customer = new Customer(cid, customerName, age, accountBalance, gender, city, atype, password,accNum);
				out.print(this.customerDAO.insert(customer));
				// System.out.println(this.customerDAO.insert(customer));
				response.sendRedirect("/Bank_Management_System_Grp23/cget"); 

			} else if (action.equalsIgnoreCase("cupdate")) {
				// code to update customer
				// code to update customer
				// write the logic for update
				int customerId = Integer.parseInt(request.getParameter("cid"));
				String customerName = request.getParameter("cname");
				int age = Integer.parseInt(request.getParameter("age"));
				float accountBalance = Float.parseFloat(request.getParameter("accountBalance"));
				String gender = request.getParameter("gender");
				String city = request.getParameter("city");
				String atype = request.getParameter("atype");

				Customer customer = new Customer(customerId, customerName, age, accountBalance, gender, city, atype);

				HttpSession httpSession = request.getSession(true);

				Customer sCustomer = (Customer) httpSession.getAttribute("customer");
				System.out.println(sCustomer);

				customer.setCid(sCustomer.getCid());

				System.out.println("update: " + customer);
				int output = this.customerDAO.update(customer);

				System.out.println(output);

				response.sendRedirect("/Bank_Management_System_Grp23/cget");
			} else if (action.equalsIgnoreCase("cdelete")) {
				HttpSession httpSession = request.getSession(true);

				Customer sCustomer = (Customer) httpSession.getAttribute("customer");
				System.out.println(sCustomer);

				int cid = sCustomer.getCid();

				boolean isDeleted = this.customerDAO.delete(cid);

				if (isDeleted) {
					response.getWriter().print("Customer deleted successfully!");
					response.sendRedirect("/Bank_Management_System_Grp23/cget");
				} else {
					response.getWriter().print("Error: Customer not found or deletion failed.");
				} 
			} else if (action.equalsIgnoreCase("cview")) {

			}

		} catch (Exception e) {
			// TODO: handle exception
		} 

	}

}
