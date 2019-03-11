package prisonmanagement;
import java.sql.*;

import javax.swing.JTextPane;

public class criminaldetailsService {
	public static Connection checkConnection() throws SQLException, ClassNotFoundException {
		//try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/prison","root","root");  
		//}
		return conn;
	}	

}
