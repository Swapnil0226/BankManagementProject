<!DOCTYPE html>
<%
	if (session.getAttribute("custId") != null) {
		int i = Integer.valueOf((String) session.getAttribute("custId"));
		System.out.println("htll" + i);
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aces Bank - Customer Home</title>
<link rel="icon" type="image/x-icon"
	href="/Bank_Management_System_Grp23/images/favicon.PNG">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

:root { -
	-base-clr: #11121a; -
	-line-clr: #42434a; -
	-hover-clr: #222533; -
	-text-clr: #e6e6ef; -
	-accent-clr: #5e63ff; -
	-secondary-text-clr: #b0b3c1;
}

* {
	font-family: sans-serif;
	margin: 0;
	padding: 0;
}

html {
	/*font-family: Poppins, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;   */
	line-height: 1.5rem;
}

body {
	min-height: 100vh;
	min-height: 100dvh;
	background-color: #11121a;
	color: #e6e6ef;
	display: grid;
	grid-template-columns: auto 1fr;
}

#sidebar {
	box-sizing: border-box;
	height: 100vh;
	width: 250px;
	padding: 5px 1em;
	background-color: #0066b2;
	border-right: 1px solid #42434a;
	position: sticky;
	top: 0;
	align-self: start;
	transition: 300ms ease-in-out;
	overflow: hidden;
	text-wrap: nowrap;
	font-weight: 700;
}

#sidebar.close {
	padding: 5px;
	width: 60px;
}

#sidebar ul {
	list-style: none;
}

#sidebar>ul>li:first-child {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 16px; . logo { font-weight : 600;
	font-size: 22px;
}

}
#sidebar ul li.active a {
	color: var(- -accent-clr);
	svg
	{
	fill
	:
	var(
	-accent-clr
	);
}

}
#sidebar a, #sidebar .dropdown-btn, #sidebar .logo {
	border-radius: .5em;
	padding: .85em;
	text-decoration: none;
	color: #e6e6ef;
	display: flex;
	align-items: center;
	gap: 1em;
	font-size: 15px;
}

.dropdown-btn {
	width: 100%;
	text-align: left;
	background: none;
	border: none;
	font: inherit;
	cursor: pointer;
}

#sidebar svg {
	flex-shrink: 0;
	fill: var(- -text-clr);
}

#sidebar a span, #sidebar .dropdown-btn span {
	flex-grow: 1;
}

#sidebar a:hover, #sidebar .dropdown-btn:hover {
	background-color: #005A9C;
}

#sidebar .sub-menu {
	display: grid;
	grid-template-rows: 0fr;
	transition: 300ms ease-in-out;
	>
	div
	{
	overflow
	:
	hidden;
}

}
#sidebar .sub-menu.show {
	grid-template-rows: 1fr;
}

.dropdown-btn svg {
	transition: 200ms ease;
}

.rotate svg:last-child {
	rotate: 180deg;
}

#sidebar .sub-menu a {
	padding-left: 2em;
}

#toggle-btn {
	margin-left: auto;
	padding: 1em;
	border: none;
	border-radius: .5em;
	background: none;
	cursor: pointer;
	svg
	{
	transition
	:
	rotate
	150ms
	ease;
}

}
#toggle-btn:hover {
	background-color: var(- -hover-clr);
}

.center {
	margin: 0;
	position: absolute;
	top: 80%;
	left: 50%;
	padding: 13px;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	cursor: pointer;
	border: none;
}

main {
	padding: min(30px, 7%);
	background-color: white;
}

main p {
	color: var(- -secondary-text-clr);
	margin-top: 5px;
	margin-bottom: 15px;
}

.container {
	border: 1px solid var(- -line-clr);
	border-radius: 1em;
	margin-bottom: 20px;
	padding: min(3em, 15%);
	h2
	,
	p
	{
	margin-top
	:
	1em
}

}
@media ( max-width : 800px) {
	body {
		grid-template-columns: 1fr;
	}
	main {
		padding: 2em 1em 60px 1em;
	}
	.container {
		border: none;
		padding: 0;
	}
	#sidebar {
		height: 60px;
		width: 100%;
		border-right: none;
		border-top: 1px solid var(- -line-clr);
		padding: 0;
		position: fixed;
		top: unset;
		bottom: 0; ul { padding : 0;
		display: grid;
		grid-auto-columns: 60px;
		grid-auto-flow: column;
		align-items: center;
		overflow-x: scroll;
	}
	ul li {
		height: 100%;
	}
	ul a, ul .dropdown-btn {
		width: 60px;
		height: 60px;
		padding: 0;
		border-radius: 0;
		justify-content: center;
	}
	ul li span, ul li:first-child, .dropdown-btn svg:last-child {
		display: none;
	}
	ul li .sub-menu.show {
		position: fixed;
		bottom: 60px;
		left: 0;
		box-sizing: border-box;
		height: 60px;
		width: 100%;
		background-color: var(- -hover-clr);
		border-top: 1px solid var(- -line-clr);
		display: flex;
		justify-content: center;
		div
		{
		overflow-x
		:
		auto;
	}
	li {
		display: inline-flex;
	}
	a {
		box-sizing: border-box;
		padding: 1em;
		width: auto;
		justify-content: center;
	}
}
}
}
</style>

</head>
<body>
	<nav id="sidebar">
		<ul>
			<li><span class="logo" href="home.jsp"><h1>Aces Bank</h1></span>
				<button onclick=toggleSidebar() id="toggle-btn">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
						<path
							d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z" /></svg>
				</button></li>

			<li><a href="CustomerHome.jsp" target="content-frame"
				onclick="loadPage(event,'home.jsp')"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
						<path
							d="M240-200h120v-200q0-17 11.5-28.5T400-440h160q17 0 28.5 11.5T600-400v200h120v-360L480-740 240-560v360Zm-80 0v-360q0-19 8.5-36t23.5-28l240-180q21-16 48-16t48 16l240 180q15 11 23.5 28t8.5 36v360q0 33-23.5 56.5T720-120H560q-17 0-28.5-11.5T520-160v-200h-80v200q0 17-11.5 28.5T400-120H240q-33 0-56.5-23.5T160-200Zm320-270Z" /></svg>
					<span>Home</span>
			</a></li>



			<li><a href="CustomerDetail.jsp" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M80-120v-720h800v720H80Zm100-180h600v-60H180v60Zm0-160h600v-60H180v60Zm0-160h600v-60H180v60Zm-20 460h640v-620H160v620Zm0-620h640-640Z" />
    </svg> <span>My Profile</span>
			</a></li>



			<li><a href="LoanRequestInit.jsp" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h207q16 0 30.5 6t25.5 17l57 57h320q33 0 56.5 23.5T880-640v400q0 33-23.5 56.5T800-160H160Zm0-80h640v-400H447l-80-80H160v480Zm0 0v-480 480Zm400-160v40q0 17 11.5 28.5T600-320q17 0 28.5-11.5T640-360v-40h40q17 0 28.5-11.5T720-440q0-17-11.5-28.5T680-480h-40v-40q0-17-11.5-28.5T600-560q-17 0-28.5 11.5T560-520v40h-40q-17 0-28.5 11.5T480-440q0 17 11.5 28.5T520-400h40Z" />
    </svg> <span>Apply for Loan</span>
			</a></li>
			<li><a href="ViewCustomerLoans" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h207q16 0 30.5 6t25.5 17l57 57h320q33 0 56.5 23.5T880-640v400q0 33-23.5 56.5T800-160H160Zm0-80h640v-400H447l-80-80H160v480Zm0 0v-480 480Zm400-160v40q0 17 11.5 28.5T600-320q17 0 28.5-11.5T640-360v-40h40q17 0 28.5-11.5T720-440q0-17-11.5-28.5T680-480h-40v-40q0-17-11.5-28.5T600-560q-17 0-28.5 11.5T560-520v40h-40q-17 0-28.5 11.5T480-440q0 17 11.5 28.5T520-400h40Z" />
    </svg> <span>Loan Application(s)</span>
			</a></li>

			<li><a href="Cprivacy_policy.jsp" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M480-80q-99 0-168.5-69.5T242-318q0-76 42-138t114-92q-5-8-7.5-18.5T388-588q0-37 26-63t63-26q37 0 63 26t26 63q0 12-2.5 22.5T555-548q72 25 114 92t42 138q0 99-69.5 168.5T480-80Zm0-60q82 0 139-57t57-139q0-82-57-139t-139-57q-82 0-139 57t-57 139q0 82 57 139t139 57Zm0-180Zm-41-120h81v-120h-81v120Zm-61 180h200v-81H378v81ZM480-450Z" />
    </svg> <span>Privacy Policy</span>
			</a></li>

			<li><a href="Cabout.jsp" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M480-520q83 0 141.5-58.5T680-720q0-83-58.5-141.5T480-920q-83 0-141.5 58.5T280-720q0 83 58.5 141.5T480-520Zm0 40q-110 0-185-75t-75-185q0-110 75-185t185-75q110 0 185 75t75 185q0 110-75 185t-185 75Zm0-220q27 0 46.5-19.5T546-720q0-27-19.5-46.5T480-786q-27 0-46.5 19.5T414-720q0 27 19.5 46.5T480-660Zm0 580q-109-86-166-161.5T257-360h446q-14 51-67 126T480-80Z" />
    </svg> <span>About Us</span>
			</a></li>

			<li><a href="CchangePass.jsp" target="content-frame"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M480-520q83 0 141.5-58.5T680-720q0-83-58.5-141.5T480-920q-83 0-141.5 58.5T280-720q0 83 58.5 141.5T480-520Zm0 40q-110 0-185-75t-75-185q0-110 75-185t185-75q110 0 185 75t75 185q0 110-75 185t-185 75Zm0-220q27 0 46.5-19.5T546-720q0-27-19.5-46.5T480-786q-27 0-46.5 19.5T414-720q0 27 19.5 46.5T480-660Zm0 580q-109-86-166-161.5T257-360h446q-14 51-67 126T480-80Z" />
    </svg> <span>Change Password</span>
			</a></li>

			<li><a href="logout"> <svg
						xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
      <path
							d="M480-600q-12 0-22-10t-10-22q0-12 10-22t22-10h240q12 0 22 10t10 22q0 12-10 22t-22 10H480ZM280-200q-33 0-56.5-23.5T200-280v-400q0-33 23.5-56.5T280-760h180q12 0 22 10t10 22q0 12-10 22t-22 10H280q-17 0-28.5 11.5T240-680v400q0 17 11.5 28.5T280-240h180q12 0 22 10t10 22q0 12-10 22t-22 10H280Zm340-40q-10 0-20-4.5t-16-12.5q-8-8-11.5-18t-.5-20q2-9 9-17l160-160H440q-12 0-22-10t-10-22q0-12 10-22t22-10h300L592-653q-7-7-9-16.5t.5-20q3-10 11.5-18t16-12.5q10-4.5 20-4.5t20 4.5q10 4.5 18 12.5l230 230q7 7 10.5 15.5T880-480q0 10-3.5 18.5T866-446L636-216q-8 8-18 12.5t-20 4.5Z" />
    </svg> <span>Logout</span>
			</a></li>

		</ul>

	</nav>
	<main> <iframe name="content-frame"
		style="width: 100%; height: 100%; border: none" src="CustomerHome.jsp"></iframe>
	</main>

	<script>
		  const toggleButton = document.getElementById("toggle-btn");
		  const sidebar = document.getElementById("sidebar");
		  const logoutButton = document.querySelector(".logout");
		
		  function toggleSidebar() {
		    sidebar.classList.toggle("close");
		    toggleButton.classList.toggle("rotate");
		
		    // Hide or show the logout button based on sidebar state
		    if (sidebar.classList.contains("close")) {
		      logoutButton.style.display = "none";
		    } else {
		      logoutButton.style.display = "block";
		    }
		
		    closeAllSubMenus();
		  }
		
		  function toggleSubMenu(button) {
		    if (!button.nextElementSibling.classList.contains("show")) {
		      closeAllSubMenus();
		    }
		
		    button.nextElementSibling.classList.toggle("show");
		    button.classList.toggle("rotate");
		
		    if (sidebar.classList.contains("close")) {
		      sidebar.classList.toggle("close");
		      toggleButton.classList.toggle("rotate");
		
		      // Hide or show the logout button based on sidebar state
		      if (sidebar.classList.contains("close")) {
		        logoutButton.style.display = "none";
		      } else {
		        logoutButton.style.display = "block";
		      }
		    }
		  }
		
		  function closeAllSubMenus() {
		    Array.from(sidebar.getElementsByClassName("show")).forEach((ul) => {
		      ul.classList.remove("show");
		      ul.previousElementSibling.classList.remove("rotate");
		    });
		  }
		
		  function logout() {
		    alert("You have been logged out.");
		    window.location.href = "#";
		  }
</script>


</body>
</html>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>