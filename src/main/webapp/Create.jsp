<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
   <%@ page import="p1.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("s1");
String email=request.getParameter("s2");
String pwd=request.getParameter("s3");
try{
	DBUtil.connect();
	out.println("connected");
	int i=DBUtil.st.executeUpdate("insert into login values('"+name+"','"+email+"','"+pwd+"');");
	out.println("connected");
	if(i>0){
		out.println("Account created");
	response.sendRedirect("Cart.jsp");
	}
	else{
		out.println("Account not created");
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