package prisonmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/criminal_details")
public class criminal_details extends HttpServlet {
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String id1=request.getParameter("prisoner_name");
		String id2=request.getParameter("prisoner_id");
		String id3=request.getParameter("datein");
		String id4=request.getParameter("dateout");
		//criminaldetailsService serv=new criminaldetailsService();
		boolean res=false;
		//res = serv.authenticate2(id1,id2,id3,id4);
		
		try {
			
			Connection conn = criminaldetailsService.checkConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("Select * from prisoner where name='" + id1 + "'");
			request.setAttribute("details", rs);
			request.getRequestDispatcher("criminaldetails.jsp").forward(request, response);
			System.out.println("Data: "+rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
			
			//response.getWriter().print("please enter valid username and password");
			//response.sendRedirect("home.html");
			return;
		}
	}
