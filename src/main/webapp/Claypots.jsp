<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DBUtil" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Claypots.css">
<title>Insert title here</title>
</head>
<body>
<div class="items">
    <h1 style="font-size: 40px">CLAY POTS COLLECTION</h1>
<form action="Cart.jsp" method="post">
    <div class="potscollection">
<%
String name = (String) request.getAttribute("name");
String email = (String) request.getAttribute("email");

%>    
<%
try{
	DBUtil.connect();
	ResultSet rs=DBUtil.st.executeQuery("select id from items where category='claypots';");
	int i=1;
	int c=0;
	while (rs.next()) {
        int itemId = rs.getInt(1);

        // Use a PreparedStatement to avoid SQL injection
        PreparedStatement preparedStatement = DBUtil.con.prepareStatement("select * from items where id=?");
        preparedStatement.setInt(1, itemId);

        ResultSet rs1 = preparedStatement.executeQuery();
        if (rs1.next()) {
			
		int id= rs1.getInt(1);
		String pname=rs1.getString(2);
		String aname=rs1.getString(3);
		int price= rs1.getInt(4);
		String img=rs1.getString(7);
		
%>
<div class="pots">
        <img
          src=<%=img %>
          alt=""
          class="img"
        />
        <h3 name="productname"><%=pname %></h3>
        <p name="artisanname">By <%=aname %></p>
        <p name="price">Rs:<%=price %></p>
        <div style="display:flex;justify-content:center;align-items:center">
        <i class="fa-solid fa-circle-minus icon" onclick="decrement(<%=c%>)"></i>
        <input type="number" placeholder="quantity" class="input" id="quan_<%=c%>"/>
        <i class="fa-solid fa-circle-plus icon" onclick="increment(<%=c%>)"></i>
        </div>
        <div class="but">
        <a href="Data.jsp?id=<%= id %>&quan=" id="addToCartLink_<%=c%>"><div class="a">Add to Cart</div></a>
        <button type="button" class="input add" onclick="addtocart(<%=id%>, <%=c%>)">Add</button>
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
<input type="button" value="Add Items" class="input vcart" onclick="sendArray()">
  <input type="submit" value="View cart" class="input vcart">
</form>
</div>
<script>
var arr = [];

function increment(x) {
	let c = document.getElementById("quan_" + x);
    c.value = Number(c.value) + 1;
}

function decrement(x) {
	let c = document.getElementById("quan_" + x);
    if (Number(c.value) > 0) {
        c.value = Number(c.value) - 1;
    }
}

function addtocart(id,x) {
	
    let q = document.getElementById("quan_" + x);
    let addToCartLink = document.getElementById("addToCartLink_" + x);
    addToCartLink.href = "Data.jsp?id=" + id + "&quan=" + Number(q.value);
    let obj = {
        id1: id,
        quan: Number(q.value)
    };
    arr.push(obj);
    localStorage.setItem('arr', JSON.stringify(arr));
    alert("Click Add to cart to Save to database");
var retrievedData = localStorage.getItem('arr');
}
</script>
    
  <script src="https://kit.fontawesome.com/acbd9f1f58.js" crossorigin="anonymous"></script>
</body>
</html>