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
import com.Dao.EmployeeDAO;
import com.Model.Customer;
import com.Model.Employee;

@WebServlet("/eregister")
public class EmployeeController extends HttpServlet {
	private EmployeeDAO employeeDao;

	public EmployeeController() {
		super();
		this.employeeDao = new EmployeeDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			if ("eregister".equalsIgnoreCase(action)) {

				String empId = request.getParameter("empId");
				String role = request.getParameter("role");
				String name = request.getParameter("name");
				String contactNumber = request.getParameter("contactNumber");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String address = request.getParameter("address");

				// System.out.println("Form Data: " + empId + ", " + role + ", "
				// + name);

				Employee e = new Employee(name, email, password, role, empId, address, contactNumber);

				int result = this.employeeDao.insert(e);

				if (result > 0) {
					// System.out.println("Employee registered successfully.");
					response.sendRedirect("home.jsp");
				} else {
					// System.out.println("Failed to register employee.");
					// response.sendRedirect("login.jsp");
				}
			}

			else if ("elogin".equalsIgnoreCase(action)) {

				String empId = request.getParameter("empId");
				String password = request.getParameter("password");

				try {
					Employee employee = this.employeeDao.login(empId, password);

					if (employee != null) {
						HttpSession session = request.getSession();
						session.setAttribute("employee", employee);
						session.setAttribute("name", employee.getName());
						response.sendRedirect("Mhome.jsp");
					} else {

						request.setAttribute("status", "failed");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			// response.sendRedirect("login.jsp");
		}
	}

}