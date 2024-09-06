<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DBUtil" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String aname=request.getParameter("a1");
String pname=request.getParameter("a2");
String desc=request.getParameter("a3");
String cate=request.getParameter("a4");
String img=request.getParameter("a6");
try{
	int price = Integer.parseInt(request.getParameter("a5")); // Default value, you can change it to another appropriate default
	
	DBUtil.connect();
	ResultSet rs1=DBUtil.st.executeQuery("Select * from extra where exid=1");
	if(rs1.next()){
	int c=rs1.getInt(2)+1;
	int i = DBUtil.st.executeUpdate("INSERT INTO items VALUES (" + c + ", '" + pname + "', '" + aname + "', " + price + ", '" + cate + "','"+desc+"','"+img+"');");
	if(i>0){
		out.println("Item added");
		DBUtil.st.executeUpdate("UPDATE extra SET c="+c+" WHERE exid=1;");
	}
	else{
		out.println("Item not added");
		response.sendRedirect("Artisan.jsp");
	}
	}
	DBUtil.st.close();
out.println("statement closed");
DBUtil.con.close();
out.println("connection closed");
}	
catch(Exception e){
	out.println("error");
	out.println(e);
}
%>
</body>
</html>