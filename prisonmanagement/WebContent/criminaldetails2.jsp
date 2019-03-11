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
<title>Criminal Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body align=center style="background-color:powderblue;">
<form method="post" >
<br>
<h1>Check Criminal Details Here</h1><br><br>
<input type="text" name="prisoner_name"  placeholder="Enter prisoner name"><br><br>	
<input type="text" name="prisoner_id"  placeholder="Enter prisoner_id">	<br><br>
<input type="date" name="datein">	<br><br>
<button type="submit" value="submit" name="subscribe">submit</button><br><br><br><br>
</form>

<%
String id1=request.getParameter("prisoner_name");
String id2=request.getParameter("prisoner_id");
String id3=request.getParameter("datein");
//criminaldetailsService serv=new criminaldetailsService();
boolean res=false;
//res = serv.authenticate2(id1,id2,id3,id4);

	
	Connection conn = criminaldetailsService.checkConnection();
	Statement st = conn.createStatement();
	ResultSet rs=null;
	if(!(id2==null||id2=="")){
	rs = st.executeQuery("Select * from nom_roll where id='" + id2 + "'");
	}else if(!(id1==null||id1=="")){
		rs = st.executeQuery("Select * from nom_roll where name='" + id1 + "'");
		System.out.println("kaboom");
	}
	else if(!(id3==null||id3=="")){
		rs = st.executeQuery("Select * from nom_roll where Dateofenter='" + id3 + "'");
	}
	System.out.println(id1+"  yo  "+id2);
	System.out.println("Data: "+rs);
%>
<table border=2 align=center style="width:100%">
<tr><td>ID</td><td>Name</td><td>Demographic details</td><td>Articles</td><td>Date of enter</td><td>Sentence time</td><td>Image</td></tr>
	<%
	if(rs!=null){
		while(rs.next())
	
	{ 
		
			
	%>
		<tr><td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><img src="<%= rs.getString(7) %>"></td></tr>
	<%

	}
	}
	%>
</table>
<h3> <a href="home2.html">BACK</h3>


</body>
</html>