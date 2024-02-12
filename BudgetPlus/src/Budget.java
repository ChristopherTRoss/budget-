

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
 * Servlet implementation class MyServlet
 */
@WebServlet("/Budget")
public class Budget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Budget() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final PrintWriter out = response.getWriter();

		 String budget = request.getParameter("budget");

		 // JDBC driver name and database URL
		 String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		 //String DB_URL = "jdbc:mysql://52.26.86.130:3306/student";
		 String DB_URL = "jdbc:mysql://localhost:3306/test";

		 // Database credentials
		 String USER = "root";
		 String PASS = "";

		 Connection conn = null;
		 //Statement stmt = null;
		 //STEP 2: Register JDBC driver
		 try {
		Class.forName("com.mysql.jdbc.Driver");
		//STEP 3: Open a connection
		 System.out.println("Connecting to database...");
		 conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
		 //STEP 4: Execute a query
		 System.out.println("Creating statement...");
		 //stmt = (Statement) conn.createStatement();
		 String sql;
		 sql = "INSERT into budget (budget_id,budget) values (?,?)";
		 PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1,budget_id);
		    ps.setString(2,budget);
		    ps.executeUpdate();
		 conn.close();
		 ps.close();
		 out.println("<html><body><b>Successfully Inserted"
                + "</b></body></html>"); 
		 
		 
		 
		} catch (ClassNotFoundException | SQLException e) {
		
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}

}
