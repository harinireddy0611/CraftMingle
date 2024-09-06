<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DBUtil" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Booking.css" />
</head>
<body>
<h1>Place Your Order</h1>
<%
String email = (String) request.getAttribute("email");
int Total=0;
%>
<table >
<th>
<td>id</td>
<td>product name</td>
<td>artisan name</td>
<td>price</td>
<td>quantity</td>
</th>
<tr>
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
		Total=Total+price;
%>
<td></td>
<td><%=id %></td>
<td><%=pname %></td>
<td><%=aname %></td>
<td><%=price %></td>
<td><%=quan %></td>
</tr>
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
</table>
<div class="container">
    <form action="Book.html">
      <h1>Provide Your Address:</h1>
      <input type="text" name="n1" placeholder="Enter your address">
      <h1>Provide Your Address:</h1>
      <input type="radio" name="payment">Cash on Delivery
      <input type="radio" name="payment">UPI
      <input type="submit" value="Place order">
    </form>
  </div>
</body>
</html>