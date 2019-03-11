<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="prisonmanagement.criminaldetailsService" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.SimpleDateFormat "%>
<%@ page import="java.util.Date "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<form method="post" align=center>
<h1 align=center>Register a new Admin</h1><br><br>
<font color="red">**User id must start with 'a'</font><br><br>
<input type="text" name="name"  placeholder="Enter  name"><br><br>	
<input type="text" name="userid"  placeholder="Enter id" ><br><br>	
<input type="password" name="pass"  placeholder="Enter password" ><br><br>	
<button type="submit" value="submit" name="subscribe" >submit</button>
<%
String id1=request.getParameter("userid");
String id2=request.getParameter("pass");
String id3=request.getParameter("name");

//criminaldetailsService serv=new criminaldetailsService();
boolean res=false;
//res = serv.authenticate2(id1,id2,id3,id4);
		//Integer result = Integer.valueOf(id2);
		//Integer result2 = Integer.valueOf(id6);
		//int result=0;
		//if(!(id6==null || id6==""))
		//result = Integer.parseInt(id6);
	Connection conn = criminaldetailsService.checkConnection();
	Statement st = conn.createStatement();
	//String qur="insert into nom_roll values(\"helo\" , \"h\", \"h\", \"h\" , \"2019-11-11\" , \"h\" , \"h\" )";
	String qur="insert into auth2 values('" + id1 + "','" + id2 + "','" + id3 + "')";
	
	st.executeUpdate(qur);
	
	%>

</form>
<center><p><a href="home2.html">HOME</a></p></center>

</body>
</html>