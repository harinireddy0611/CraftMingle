<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
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
String name = (String) request.getAttribute("name");
String email = (String) request.getAttribute("email");
if (email == null || email.equals("null")) {
    email="21eg105f29@anurag.edu.in";
}
String address="";

    String itemId = request.getParameter("id");
    String quantity = request.getParameter("quan");
    try{
    	DBUtil.connect();
    	ResultSet rs=DBUtil.st.executeQuery("select * from items where id="+itemId+";");
    	if(rs.next()) {
    		String aname=rs.getString(3);
    		String pname=rs.getString(2);
    		String desc=rs.getString(6);
    		String cate=rs.getString(5);
    		String img=rs.getString(7);
    		int price = rs.getInt(4);
    	DBUtil.st.execute("insert into cart values(" + itemId + ", '" + pname + "'," + quantity + ", " + price + ", '" + address + "', '" + aname + "', '" + email + "', '" + cate + "','"+img+"');");
    	response.sendRedirect("Claypots.jsp");
    }
    }
    catch(Exception e){
    	out.println("error");
    	out.println(e);
    }
    
%>

</body>
</html>