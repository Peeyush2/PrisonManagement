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
<title>Add Duty</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<h1><center>ADD DUTY</center></h1>
<form method="post" align=center>
<br>
<center><input type="text" name="prisoner_id"  placeholder="Enter prisoner id"></center><br>	
<center><input type="text" name="place"  placeholder="Enter place"></center><br>		
<center><input type="date" name="datein"  placeholder="date in"></center><br>	
<center><input type="date" name="dateout"  placeholder="date out"></center><br>	
<center><input type="text" name="why"  placeholder="Duty"></center><br>	
<center><input type="text" name="prisoner_name"  placeholder="Enter prisoner name"></center><br>	
<center><button type="submit" value="submit" name="subscribe">ADD Prisoner</button></center>
<%
String id1=request.getParameter("prisoner_id");
String id2=request.getParameter("place");
String id3=request.getParameter("datein");
String id4=request.getParameter("dateout");
String id5=request.getParameter("why");
String id6=request.getParameter("prisoner_name");
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
	String qur="insert into duty values('" + id1 + "','" + id2 + "','" + id3 + "','" + id4 + "','" + id5 + "','" + id6 + "')";
	
	st.executeUpdate(qur);
	
	%>
<br><br><p><a href="up.jsp">BACK</p>


</form>

</body>
</html>