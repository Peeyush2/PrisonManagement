package prisonmanagement;
import java.sql.*;
public class loginService {
	public String check_pwd(String s) { 
		 String str=null;
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/prison","root","root");  
		Statement stmt=con.createStatement();  
		ResultSet rs=null;
		char ch=s.charAt(0);
		if(ch!='a') {
		rs=stmt.executeQuery("select * from police");  }
		else
			rs=stmt.executeQuery("select * from auth2"); 
		if(rs!=null)
	while(rs.next())  
	{
		if (rs.getString(1).equals(s))
			{str=rs.getString(2);
			break;}
		//con.close();  
		
	}}catch(Exception e){ System.out.println(e);}
	return str;
	}
	public boolean authenticate(String user,String pwd) throws SQLException
	{
		String p=check_pwd(user);
		if(p!=null && p.equals(pwd))
		{
			return true;
		}
		else
			return false;
	}

}
