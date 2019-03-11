<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="prisonmanagement.criminaldetailsService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>In-Out Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<form method="post" align=center>
<br><h1>Check In-Out Details Here</h1><br><br>
<p>Give Time IN:
<input type="date" name="timestamp"  placeholder="please give date"><br><br>	
<input type="time" name="timestamp2"  placeholder="please give time out"><br><br>	
<button type="submit" value="submit" name="subscribe">submit</button><br><br>


<%
String id1=request.getParameter("timestamp");
String id2=request.getParameter("timestamp2");

//criminaldetailsService serv=new criminaldetailsService();
boolean res=false;
//res = serv.authenticate2(id1,id2,id3,id4);

	
	Connection conn = criminaldetailsService.checkConnection();
	Statement st = conn.createStatement();
	ResultSet rs=null;
	if(!(id1==null || id1==""))
	rs = st.executeQuery("Select * from inoutreg where tin='" + id1 + "'");
	if(!(id2==null || id2==""))
		rs = st.executeQuery("Select * from inoutreg where tout='" + id2 + "'");
	System.out.println("Data: "+rs);
%>
<table border=2 align=center style="width:100%">
<tr><td>ID</td><td>reason</td><td>duration</td><td>Time out</td><td>Time in</td></tr>
	<%if(rs!=null) 
	while(rs.next())
	{ %>
		<tr><td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		</tr>
	<%
	}%>
</table>
<h3> <a href="home.html">BACK</h3>


</body>
</html>