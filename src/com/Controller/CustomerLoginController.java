package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.CustomerDAO;
import com.Model.Customer;

@WebServlet("/customerlogin")
public class CustomerLoginController extends HttpServlet {

	private CustomerDAO customerDAO;

	public CustomerLoginController() {
		super();
		this.customerDAO = new CustomerDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println(action);
		System.out.println();
		try {
			if (action != null && action.equalsIgnoreCase("clogin")) {
				String customerId = request.getParameter("customerId");
				String password = request.getParameter("password");
				PrintWriter out = response.getWriter();
				out.print(customerId);

				System.out.println("customer" + customerId);

				// Attempt to find the customer by ID
				Customer customer = customerDAO.findByCustIdAndPassword(Integer.parseInt(customerId), password);
				System.out.println("customer==>" + customer);

				HttpSession httpSession = request.getSession();
				if (customer != null) {
					httpSession.setAttribute("custId", customerId);
					httpSession.setAttribute("customerId", customerId);
					httpSession.setAttribute("custName", customer.getCname());
					httpSession.setAttribute("cpassword", customer.getPassword());
					System.out.println("Proper login ");
					// If customer is found, set session attributes
					httpSession.setAttribute("customer", customer);
					httpSession.setAttribute("role", "customer");

					System.out.println("Customer who is trying to login is: " + customer);
					response.sendRedirect("Chome.jsp");
				} else {
					System.out.println("Not Proper login ");
					request.setAttribute("status", "failed");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					// If no customer is found, set an error message in the
					// session
					httpSession.setAttribute("loginError", "Invalid Customer ID!");
					// response.sendRedirect("Chome.jsp");
				}
				// code to update customer
			} else if (action.equalsIgnoreCase("cdelete")) {
				int cid = Integer.parseInt(request.getParameter("cid"));

				boolean isDeleted = this.customerDAO.delete(cid);

				if (isDeleted) {
					response.getWriter().print("Customer deleted successfully!");
				} else {
					response.getWriter().print("Error: Customer not found or deletion failed.");
				}
			} else if (action.equalsIgnoreCase("changePassword")) {

				HttpSession session = request.getSession(true);

				int check = 0;
				String newPassword = request.getParameter("newPassword");
				String confirmPassword = request.getParameter("confirmPassword");
				int custId = Integer.parseInt((String) session.getAttribute("custId"));
				System.out.println(custId);

				if (newPassword.equals(confirmPassword)) {

					check = this.customerDAO.updatePassword(custId, newPassword);
					System.out.println(check);
					response.sendRedirect("CustomerHome.jsp");
				} else {
					response.sendRedirect("error.jsp");
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}