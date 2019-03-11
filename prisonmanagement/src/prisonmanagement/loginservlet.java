package prisonmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String id=request.getParameter("policeid");
		String pd=request.getParameter("password");
		loginService serv=new loginService();
		boolean res=false;
		try {
			res = serv.authenticate(id, pd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res==true)
		{	
			request.getSession().setAttribute("user", id);
			char c=id.charAt(0);
			if(c=='a')
			response.sendRedirect("home2.html");
			else
				response.sendRedirect("home.html");
			return;
		}
		else 
		{
			
			response.getWriter().print("please enter valid username and password");
			//response.sendRedirect("home.html");
			return;
		}
	}

}
