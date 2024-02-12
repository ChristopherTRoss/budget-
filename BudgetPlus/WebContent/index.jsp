<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page session="false" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BudgetPlus</title>
<link rel="stylesheet" href="FormScreen.css" type="text/css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <ul class="header" style="z-index: 1; position: absolute;">
        <link rel="stylesheet" href="navbar.css" type="text/css"/> 
        <li class="header"><a href="index.jsp" id ="homenav">Home</a></li>
        <li class="header"><a href="budget.html" id ="budgetnav">Budget</a></li>
        <li class="header"><a href="expenses.html" id ="expensesnav">Expenses</a></li>
        <li class="header"><a href="savings.html" id ="savingsnav">Savings</a></li>
        <li style="float:right"><a class="active" href="login.html">Sign Out</a></li>
    </ul>

    <style>
	 html {background-color: #ededed;}
	 table {
			border-collapse: collapse;
			width: 100%;
			
			}
		th, td {
			text-align: left;
			padding: 8px;
			height: 50px;
			
			}

		tr:nth-child(odd){background-color: #f2f2f2}

		th {
			background-color: #024978;
			color: white;
			border-style:solid;border-width:1px;border-color:#000000;
			padding-top: 25px;				
			}
		.expenses{
			background-color: white;
			padding-top: 20px;	
		    padding-bottom: 30px;
		    background-color: white;
		    width: 450px;
		    height: 350px;
		    position: absolute;
		    display: inline-block;
		    top: 100px;
		    left: 760px;
		    font-family:Arial, Sans-Serif;
			overflow: auto;
			}
			
		.budget{
		    background-color: white;
		    width: 450px;
		    height: 630px;
		    position: absolute;
		    display: inline-block;
		    top: 100px;
		    left: 220px;
		    font-family:Arial, Sans-Serif;
		    
		}
		.text{
		    background-color: white;
		    z-index: 1;
		    width: 300px;
		    height: 30px;
		    position: absolute;
		    display: inline-block;
		    top: 475px;
		    left: 760px;
		    font-family:Arial, Sans-Serif;
		    
		}
		#piechart {
		
		    position: absolute;
		    display: inline-block;
		    top: 440px;
		    left: 700px;
		    overflow:hidden;
		    
		    
		}
		.container {
			background-color: #ededed; 
		    display: inline-block;
		    width:100%;
		    height: 800px;
		    
		}
		h1, h2 {
    		display: inline;
    		float: left;
		}
		table.tblexp tr td { font-size: 11.5px; }
	 </style>
</head>
<body>
<body id = "home">
        
        <div class="container">
        <div class = "text">
        <h4>Expense Breakdown:</h4></div>
        <div id="piechart" style="width: 530px; height: 300px;">
          	<form method="post">
				
				<%
				try
				{
					int clothing = 0;
					int food = 0;
					int education = 0;
					int entertainment = 0;
					int housing = 0;
					int medical = 0;
					int personal = 0;
					int transportation = 0;
					int utilities = 0;
					int savings = 0;
					
				HttpSession session = request.getSession(false);
				String un = (String)session.getAttribute("username");
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost/BudgetPlus";
				String username="root";
				String password="";
				Connection conn=DriverManager.getConnection(url,username,password);
				Statement stmt=conn.createStatement();
				ResultSet rs1 = (ResultSet) stmt.executeQuery("SELECT user_id FROM login WHERE username='" + un +"'");
			    if (rs1.next()) {
			    	String user_id = rs1.getString("user_id");
			    	ResultSet rs2=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Clothing' AND user_id= '" + user_id +"'");
			    	while (rs2.next()) {
			    	    clothing = rs2.getInt(1); 
			    	    System.out.println(clothing);
			    	}
			    	ResultSet rs3=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Food' AND user_id= '" + user_id +"'");
			    	while (rs3.next()) {
			    	     food = rs3.getInt(1); 
			    	    System.out.println(food);
			    	}
			    	ResultSet rs4=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Education' AND user_id= '" + user_id +"'");
			    	while (rs4.next()) {
			    	     education = rs4.getInt(1); 
			    	    System.out.println(education);
			    	}
			    	ResultSet rs5=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Entertainment' AND user_id= '" + user_id +"'");
			    	while (rs5.next()) {
			    	     entertainment = rs5.getInt(1); 
			    	    System.out.println(entertainment);
			    	}
			    	ResultSet rs6=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Housing' AND user_id= '" + user_id +"'");
			    	while (rs6.next()) {
			    	     housing = rs6.getInt(1); 
			    	    System.out.println(housing);
			    	}
			    	ResultSet rs7=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Medical' AND user_id= '" + user_id +"'");
			    	while (rs7.next()) {
			    	     medical = rs7.getInt(1); 
			    	    System.out.println(medical);
			    	}
			    	ResultSet rs8=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Personal' AND user_id= '" + user_id +"'");
			    	while (rs8.next()) {
			    	     personal = rs8.getInt(1); 
			    	    System.out.println(personal);
			    	}
			    	ResultSet rs9=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Transportation' AND user_id= '" + user_id +"'");
			    	while (rs9.next()) {
			    	     transportation = rs9.getInt(1); 
			    	    System.out.println(transportation);
			    	}
			    	ResultSet rs10=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Utilities' AND user_id= '" + user_id +"'");
			    	while (rs10.next()) {
			    	     utilities = rs10.getInt(1); 
			    	    System.out.println(utilities);
			    	}
			    	ResultSet rs11=stmt.executeQuery("Select savings_amt from savings where user_id= '" + user_id +"'");
			    	while (rs11.next()) {
			    	     savings = rs11.getInt(1); 
			    	    System.out.println(utilities);
			    	}

			    	%>
			    	
			    	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					
					<script type="text/javascript">
					// Load google charts
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					
					// Draw the chart and set the chart values
					function drawChart() {
					  var data = google.visualization.arrayToDataTable([
					  ['Expense', 'Expense Amount'],
					          ['Clothing',     <%=clothing%>],
					          ['Food',      <%=food%>],
					          ['Education',  <%=education%>],
					          ['Entertainment', <%=entertainment%>],
					          ['Housing',    <%=housing%>],
					          ['Medical',    <%=medical%>],
					          ['Personal',    <%=personal%>],
					          ['Savings',    <%=savings%>],
					          ['Transportation',    <%=transportation%>],
					          ['Utilities',    <%=utilities%>]
					]);
					
					  // Optional; add a title and set the width and height of the chart
					var options = {
					          	title: 'Budget Breakdown',
					          		titleTextStyle: {
					          	        
					          	        fontSize: 14 // 12, 18 whatever you want (don't specify px)
					          		},
					        		legendTextStyle: {
					  	        
					  	        		fontSize: 12 // 12, 18 whatever you want (don't specify px)
					  				},
					  				chartArea:{middle:0,top:40,width:'60%',height:'70%'},
					  				legend: 'none'
					          			        
					        };
					
					  // Display the chart inside the <div> element with id="piechart"
					  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					  chart.draw(data, options);
					}
					</script>
			    <%
			    } 
			    } catch(Exception e){
			    	e.printStackTrace();
			    }
			    %>
		</form>
	</div>
        
           <div class="budget">
           <form method="post">

				<%
				try
				{
					int clothing = 0;
					int food = 0;
					int education = 0;
					int entertainment = 0;
					int housing = 0;
					int medical = 0;
					int personal = 0;
					int transportation = 0;
					int utilities = 0;
					int savings = 0;
					
				HttpSession session = request.getSession(false);
				String un = (String)session.getAttribute("username");
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost/BudgetPlus";
				String username="root";
				String password="";
				Connection conn=DriverManager.getConnection(url,username,password);
				Statement stmt=conn.createStatement();
				ResultSet rs1 = (ResultSet) stmt.executeQuery("SELECT user_id FROM login WHERE username='" + un +"'");
			    if (rs1.next()) {
			    	String user_id = rs1.getString("user_id");
			    	ResultSet rs2=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Clothing' AND user_id= '" + user_id +"'");
			    	while (rs2.next()) {
			    	    clothing = rs2.getInt(1); 
			    	    System.out.println(clothing);
			    	}
			    	ResultSet rs3=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Food' AND user_id= '" + user_id +"'");
			    	while (rs3.next()) {
			    	     food = rs3.getInt(1); 
			    	    System.out.println(food);
			    	}
			    	ResultSet rs4=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Education' AND user_id= '" + user_id +"'");
			    	while (rs4.next()) {
			    	     education = rs4.getInt(1); 
			    	    System.out.println(education);
			    	}
			    	ResultSet rs5=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Entertainment' AND user_id= '" + user_id +"'");
			    	while (rs5.next()) {
			    	     entertainment = rs5.getInt(1); 
			    	    System.out.println(entertainment);
			    	}
			    	ResultSet rs6=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Housing' AND user_id= '" + user_id +"'");
			    	while (rs6.next()) {
			    	     housing = rs6.getInt(1); 
			    	    System.out.println(housing);
			    	}
			    	ResultSet rs7=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Medical' AND user_id= '" + user_id +"'");
			    	while (rs7.next()) {
			    	     medical = rs7.getInt(1); 
			    	    System.out.println(medical);
			    	}
			    	ResultSet rs8=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Personal' AND user_id= '" + user_id +"'");
			    	while (rs8.next()) {
			    	     personal = rs8.getInt(1); 
			    	    System.out.println(personal);
			    	}
			    	ResultSet rs9=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Transportation' AND user_id= '" + user_id +"'");
			    	while (rs9.next()) {
			    	     transportation = rs9.getInt(1); 
			    	    System.out.println(transportation);
			    	}
			    	ResultSet rs10=stmt.executeQuery("Select sum(expense_amt) from expenses where expense = 'Utilities' AND user_id= '" + user_id +"'");
			    	while (rs10.next()) {
			    	     utilities = rs10.getInt(1); 
			    	    System.out.println(utilities);
			    	}
			    	ResultSet rs11=stmt.executeQuery("Select savings_amt from savings where user_id= '" + user_id +"'");
			    	while (rs11.next()) {
			    	     savings = rs11.getInt(1); 
			    	    System.out.println(utilities);
			    	}
					ResultSet rs=stmt.executeQuery("Select budget_amt from budget where user_id= '" + user_id +"'");
			    	while (rs.next()) {
			    	     int budget = rs.getInt(1);
			    	     budget = budget - savings - clothing - food - education - entertainment - housing - medical - personal - transportation - utilities;
			    	    System.out.println("Budget: " + budget);
			    	    if (budget > 0) {
			    	    	%>
						    <h2>Remaining Budget: </h2><h2 style= "color: green;"}>&nbsp;$<%=budget%></h2>
						    
						<%
			    	    } else {
			    	    	%>
						    <h2>Remaining Budget: </h2><h2 style= "color: red;">&nbsp;$<%=budget%></h2>
						    
						<%
			    	    }
			    	    
			    	    %>
			    	    <br>
			    	    <br>
			    	    <br>
			    	    <table border="2">
							<col width="130">
							<col width="80">
							<tr>
							<th>Expense</th>
							<th>Expense Totals</th>
							</tr>
			    	    <tr>
			    	    	<td>Clothing</td>
			    	    	<td><%=clothing%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Food</td>
			    	    	<td><%=food%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Education</td>
			    	    	<td><%=education%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Entertainment</td>
			    	    	<td><%=entertainment%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Housing</td>
			    	    	<td><%=housing%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Medical</td>
			    	    	<td><%=medical%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Personal</td>
			    	    	<td><%=personal%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Savings</td>
			    	    	<td><%=savings%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Transportation</td>
			    	    	<td><%=transportation%></td>
			    		</tr>
			    		<tr>
			    	    	<td>Utilities</td>
			    	    	<td><%=utilities%></td>
			    		</tr>
			    		</table>
			    	<%
			    	
					}
					
					  
					    }
				}
					catch(Exception e)
					{
					    e.printStackTrace();
					    }


			%>
			</form>
           </div>
        
          <div class="expenses">
            <form method="post">
            
			<table border="2">
			<col width="130">
			<col width="80">
			<tr>
			<th>Expenses</th>
			<th>Expense Amount</th>
			</tr>
			<%
			try
			{
				HttpSession session = request.getSession(false);
				String un = (String)session.getAttribute("username");
				System.out.println(un);
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/BudgetPlus";
				String username="root";
				String password="";
				Connection conn=DriverManager.getConnection(url, username, password);
				Statement stmt=conn.createStatement();
			    ResultSet rs1 = (ResultSet) stmt.executeQuery("SELECT user_id FROM login WHERE username='" + un +"'");
			    if (rs1.next()) {
			    	String user_id = rs1.getString("user_id");
			    
			    	ResultSet rs=stmt.executeQuery("Select expense, expense_amt from expenses where user_id= '" + user_id +"'");
			    	while(rs.next())
			    	{
			    	%>
			    	    <tr>
			    	    	<td><%=rs.getString("expense") %></td>
			    	    	<td><%=rs.getInt("expense_amt") %></td>
			    		</tr>
			    	<%
			    	}
			    	%>
			    	    </table>
			    	    <br>
			    	    <%
			    	    rs.close();
			    	    stmt.close();
			    	    conn.close();
			    	    }
			    }
			catch(Exception e){
			    e.printStackTrace();
			    }
			%>
			
			
			</form> 
          </div>
          
          
  </div>
</body>
</html>