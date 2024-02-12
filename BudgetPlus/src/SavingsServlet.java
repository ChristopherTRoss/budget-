

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class SavingsServlet
 */
@WebServlet("/SavingsServlet")
public class SavingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final PrintWriter out = response.getWriter();
		String savings = request.getParameter("savings");

		 // JDBC driver name and database URL
		 String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		 //String DB_URL = "jdbc:mysql://52.26.86.130:3306/student";
		 String DB_URL = "jdbc:mysql://localhost:3306/BudgetPlus";

		 // Database credentials
		 String USER = "root";
		 String PASS = "";
		 
		 String user_id = "";
		 
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
	            	user_id = rs.getString("user_id");
	            	System.out.println(user_id);
	            	ResultSet rs1 = (ResultSet) stmt.executeQuery("SELECT savings_id FROM savings where savings_id='" + user_id +"'");
	            	boolean userExists1 = rs1.next();
	            	 if (userExists1){
	            		 PreparedStatement ps = con.prepareStatement("Update savings set savings_amt = (?) where user_id='" + user_id +"'");
			       		 ps.setString(1,savings);
			       		 ps.executeUpdate();
			       		 con.close();
			       		 ps.close();
			       		response.setContentType("text/html");  
			       		out.println("<script type=\"text/javascript\">");  
			        	out.println("alert('Savings successfully updated.');");  
			        	out.println("window.location.assign('index.jsp');");  
			        	out.println("</script>");
			        	return;
			        	
	            	 } else {
	            		 PreparedStatement ps1 = con.prepareStatement("INSERT into savings (savings_id, user_id, savings_amt) values (?,?,?)");
			       		 ps1.setString(1, user_id);
			       		 ps1.setString(2, user_id);
			       		 ps1.setString(3, savings);
			       		 ps1.executeUpdate();
			       		 con.close();
			       		 ps1.close();
			       		 
			       		response.setContentType("text/html");  
			       		out.println("<script type=\"text/javascript\">");  
			        	out.println("alert('Savings successfully entered.');");  
			        	out.println("window.location.assign('index.jsp');");  
			        	out.println("</script>");
			        	return;
	            	 } 
			       		
	            }
			 
		 } catch (ClassNotFoundException | SQLException e) {
			 e.printStackTrace();
		 }
	}

}
