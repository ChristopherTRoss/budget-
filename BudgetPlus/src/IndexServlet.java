

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
	    final PrintWriter out = response.getWriter();
	    out.println("<html>");
	    out.println("<head><title>BudgetPlus</title></head>");
	    out.println("<body>");
	   

		String user_id="";
		long budget = 0;
		long savings = 0;
		
		
		try {
			
			HttpSession session = request.getSession();
			String un = (String)session.getAttribute("username");
			System.out.println(un);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/BudgetPlus", "root", "");
			Statement stmt = (Statement) con.createStatement();
	        String sql = "SELECT user_id FROM login WHERE username='" + un +"'";
	        ResultSet rs = (ResultSet) stmt.executeQuery(sql);
	        boolean userExists = rs.next();
	        if (userExists){
	          
	           	
            }
		} catch(ClassNotFoundException | SQLException e){
            	e.printStackTrace();
            } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
