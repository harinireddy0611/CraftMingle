<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="p1.DBUtil" %>
    <%@ page import="java.sql.*" %>
   <%@ page import="java.util.*" %> 
   <%@ page import="p1.Item" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Cart.css" />
<title>CraftMingle | Cart</title>
</head>
<body>
<%
String name = (String) request.getAttribute("name");
String email = (String) request.getAttribute("email");
if (name == null || name.equals("null")) {
    response.sendRedirect("Login.html");
}

int total=0;
%>
<h1 style="font-size:40px">Welcome <%= name %></h1>
<h2 style="font-size:30px">Your Cart</h2>
<div class="but">
<a href="Claypots.jsp"><div class="a">Go To Browsing</div></a>
<a href="Booking.jsp"><div class="a">Buy Now</div></a>
</div>
<div class="potscollection">
<%
try{
	DBUtil.connect();
	ResultSet rs=DBUtil.st.executeQuery("select itemid,itemno from cart where usermail='"+email+"';");
	int i=1;
	int c=0;
	while (rs.next()) {
        int itemId = rs.getInt(1);
		int quan=rs.getInt(2);
        // Use a PreparedStatement to avoid SQL injection
        PreparedStatement preparedStatement = DBUtil.con.prepareStatement("select * from items where id=?");
        preparedStatement.setInt(1, itemId);

        ResultSet rs1 = preparedStatement.executeQuery();
        if (rs1.next()) {
		int id= rs1.getInt(1);
		String pname=rs1.getString(2);
		String aname=rs1.getString(3);
		int price= rs1.getInt(4);
		String cate=rs1.getString(5);
		String img=rs1.getString(7);
		total=total+price*quan;
%>
	  <div class="pots">
        <div class="div1"><img
          src=<%=img %>
          alt=""
          class="img"
        />
        </div>
        <div class="div2">
        <h3 name="productname"><%=pname %></h3>
        <p name="artisanname">By <%=aname %></p>
        <p name="price">Rs:<%=price %></p>
        <p name="quan">Quantity:<%=quan %></p>
        <p name="cate">Category:<%=cate %></p>
		</div>
		</div>
<% 
	}
        i++;
        c++;
        rs1.close();
        preparedStatement.close();
}
}
catch(Exception e){
	out.println("error");
	out.println(e);
}

%>
</div>
<h2 style="font-size:30px">Total Price of the Cart is:<%=total %></h2>


</body>
</html>