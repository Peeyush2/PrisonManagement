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
<title>Add new prisoner</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
<center><h1>Give Details of new Prisoner to add</h1></center>
<form method="post" align=center>
<input type="text" name="prisoner_name"  placeholder="Enter prisoner name"><br><br>	
<input type="text" name="prisoner_id"  placeholder="Enter prisoner id"><br><br>	
<input type="text" name="prisoner_demodet"  placeholder="Demographic details"><br><br>	
<input type="text" name="articles"  placeholder="Enter articles"><br><br>
<input type="text" name="crime"  placeholder="Enter crime"><br><br>		
<input type="date" name="datein"  placeholder=""><br><br>	
<input type="text" name="sentence"  placeholder="Enter jail time in months"><br><br>
<input type="text" name="image"  placeholder="give image path"><br><br>	
<button type="submit" value="submit" name="subscribe">submit</button>
<%
String id1=request.getParameter("prisoner_name");
String id2=request.getParameter("prisoner_id");
String id3=request.getParameter("prisoner_demodet");
String id4=request.getParameter("articles");
String id5=request.getParameter("datein");
String id6=request.getParameter("sentence");
String id7=request.getParameter("image");
String id8=request.getParameter("crime");

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
	String qur="insert into nom_roll values('" + id2 + "','" + id1 + "','" + id3 + "','" + id4 + "','" + id5 + "','" + id6 + "','" + id7 + "')";
	String qur2="insert into prisoner values('" + id2 + "','" + id1 + "','" + id7 + "','" + id8 + "','" + id6 + "','" + id5 + "')";
	st.executeUpdate(qur);
	st.executeUpdate(qur2);
	
	%>

<br><br><p><a href="up.jsp">BACK</p>
</form>

</body>
</html>