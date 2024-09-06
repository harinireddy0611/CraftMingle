<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DBUtil" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CraftMingle | Login</title>
</head>
<body>

<%
String email=request.getParameter("l1");
String pwd=request.getParameter("l2");
try{
	DBUtil.connect();
	out.println("connected");
	ResultSet rs=DBUtil.st.executeQuery("Select * from login where ( email='"+email+"' and password='"+pwd+"' )");
	if(rs.next()){
		String name=rs.getString(1);
		String dataToSend = name;
		String data2=email;
	    request.setAttribute("name", dataToSend);
	    request.setAttribute("email", data2);
	    request.getRequestDispatcher("Cart.jsp").forward(request, response);
	    request.getRequestDispatcher("Data.jsp").forward(request, response);
	    request.getRequestDispatcher("Claypots.jsp").forward(request, response);
	    response.sendRedirect("Home.html");
	    %>

		<script>
		    // Use JavaScript to store data in local storage
		    var userData = {
		        name: '<%= name %>',
		        email: '<%= email %>',
		        pwd: '<%= pwd %>'
		    };
		    console.log('User Data:', userData);
		    // Convert the JavaScript object to a JSON string and store it in local storage
		    localStorage.setItem('userData', JSON.stringify(userData));

		    </script>

		    <%   
	}
	else{
		out.println("Invalid credentials");
		response.sendRedirect("Login.html");
	}
	DBUtil.st.close();
out.println("statement closed");
DBUtil.con.close();
out.println("connection closed");
}	
catch(Exception e){
	out.println("error");
}
%>
</body>
</html>