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
<title>Add visitors</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<form method="post" align=center>
<h1>Give visitors Details</h1>
<input type="text" name="prisoner_id"  placeholder="Enter prisoner id"><br><br>	
<input type="text" name="place"  placeholder="Enter name"><br><br>		
<input type="text" name="realtion"  placeholder="Realtion"><br><br>	
<input type="date" name="datein"  placeholder="date"><br><br>	
<input type="time" name="time1"  placeholder="time"><br><br>	
<input type="time" name="time2"  placeholder="time"><br><br>	

<button type="submit" value="submit" name="subscribe">submit</button>
<%
String id1=request.getParameter("prisoner_id");
String id2=request.getParameter("place");
String id3=request.getParameter("relation");
String id4=request.getParameter("datein");
String id5=request.getParameter("time1");
String id6=request.getParameter("time2");
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
	//String qur="insert into nom_roll values(helo ,h, h,2019-11-11,00:00:00,00:00:00 )";
	String qur="insert into request values('" + id1 + "','" + id2 + "','" + id3 + "','" + id4 + "','" + id5 + "','" + id6 + "')";
	
	st.executeUpdate(qur);
	
	%>

<br><br><p><a href="up.jsp">BACK</p>
</form>

</body>
</html>