<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="prisonmanagement.criminaldetailsService" %>
<%@ page import="java.text.SimpleDateFormat " %>
<%@ page import=" java.util.Date" %>>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Release Diary</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<h1 style="text-align:center">Release Diary</h1>

<%




//criminaldetailsService serv=new criminaldetailsService();
boolean res=false;
//res = serv.authenticate2(id1,id2,id3,id4);

	
	Connection conn = criminaldetailsService.checkConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("Select * from nom_roll");
	//System.out.println("Data: "+rs.getInt(5)+rs.getInt(6));
%>
<table border=2 text-align=center style="width:100%">
<tr><td>ID</td><td>Name</td><td>Date of enter</td><td>Sentence</td></tr>
	<% while(rs.next())
	{%>
		<tr><td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		</tr>
	<%
	}%>
</table>


<h3> <a href="home.html">BACK</h3>
</body>
</html>