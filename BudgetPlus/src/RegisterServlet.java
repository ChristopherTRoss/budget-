

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

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		String email=request.getParameter("email");
		PrintWriter out = response.getWriter();
		// Connect to mysql and verify username password
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/BudgetPlus", "root", "");
			Statement stmt = (Statement) conn.createStatement();
            String sql = "SELECT * FROM login WHERE username='" + un +"'";
            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
            boolean userExists = rs.next();
            if (userExists){
            	response.setContentType("text/html");  
        		out.println("<script type=\"text/javascript\">");  
        		out.println("alert('Username already exists.');");  
        		out.println("window.location.assign('registration.html');");  
        		out.println("</script>");
        		return;
            }
		} catch(ClassNotFoundException | SQLException e){
            	e.printStackTrace();
            } 
            
            try {
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection c = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/BudgetPlus", "root", "");
    			PreparedStatement ps = c.prepareStatement("Insert into login (username, password, email) values (?, ?, ?)");
    			ps.setString(1, un);
    			ps.setString(2, pw);
    			ps.setString(3, email);
    			ps.executeUpdate();
    			ps.close();
    			c.close();
    			
    		
    		response.setContentType("text/html");  
    		out.println("<script type=\"text/javascript\">");  
    		out.println("alert('Successfully registered.');");  
    		out.println("window.location.assign('login.html');");  
    		out.println("</script>");
    		return;
    		
            } catch( ClassNotFoundException | SQLException e){
        	e.printStackTrace();
        }
        
	
	}

}
