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
<title>Visitors Request</title>
<title>Give Personal Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<form method="post" align=center>
<h1>Check for Visitors Here</h1>
<input type="text" name="prisoner_id"  placeholder="Enter prisoner id"><br><br>	
<input type="text" name="person_name"  placeholder="Enter name">	<br><br>	
<input type="date" name="datein"  placeholder=""><br><br>	
<button type="submit" value="submit" name="subscribe">submit</button><br><br>

</form>
<%
String id2=request.getParameter("prisoner_id");
String id3=request.getParameter("person_name");
String id4=request.getParameter("datein");


//criminaldetailsService serv=new criminaldetailsService();
boolean res=false;
//res = serv.authenticate2(id1,id2,id3,id4);

	
	Connection conn = criminaldetailsService.checkConnection();
	Statement st = conn.createStatement();
	ResultSet rs=null;
	if(!(id2==null || id2==""))
	rs = st.executeQuery("Select * from request where id='" + id2 + "'");
	else if(!(id4==null || id4==""))
		rs = st.executeQuery("Select * from request where dob='" + id4 + "'");
	else if(!(id3==null || id3==""))
		rs = st.executeQuery("Select * from request where rel_name='" + id3 + "'");
	System.out.println("Data: "+rs);
%>
<table border=2 style="width:100%">
<tr><td>ID</td><td>Name of person</td><td>relation</td><td>Date of booking</td><td>time in</td><td>time out</td></tr>
	<%
	if(rs!=null)
	{
	while(rs.next())
	{%>
		<tr><td><%= rs.getInt(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		</tr>
	<%
	}}%>
</table>
<center><h3> <a href="home.html">BACK</h3></center>


</body>
</html>