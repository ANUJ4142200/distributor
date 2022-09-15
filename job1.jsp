<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<%
    String btnval=request.getParameter("b1");
     if(btnval.equalsIgnoreCase("save"))
     {
    	String t1=request.getParameter("t1");
    	String t2=request.getParameter("t2");
    	String t3=request.getParameter("t3");
    	
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
        PreparedStatement psmt=conn.prepareStatement("insert into job values(?,?,?)");
    	psmt.setString(1,t1);
    	psmt.setString(2,t2);
    	psmt.setString(3,t3);
    	psmt.executeQuery();
    	out.println("<script>alert('Record saved....')</script>");
    }
    catch(Exception e)
    {
    	out.println(e.toString());
    }
     }//End of save
     
     
     if(btnval.equalsIgnoreCase("delete"))
     {
    	
    String t1=request.getParameter("t1");
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
        PreparedStatement psmt=conn.prepareStatement("delete from job where id=?");
    	psmt.setString(1,t1);
    	psmt.executeQuery();
    	out.println("<script>alert('Record Deleted....')</script>");
    }
    catch(Exception e)
    {
    	out.println(e.toString());
    }
     }//End of delete
   
     
     if(btnval.equalsIgnoreCase("update"))
     {
    	String t1=request.getParameter("t1");
    	String t2=request.getParameter("t2");
    	String t3=request.getParameter("t3");
    	
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
        PreparedStatement psmt=conn.prepareStatement("update job set job_title=?, salary=? where job_id=?");
    	psmt.setString(1,t2);
    	psmt.setString(2,t3);
    	psmt.setString(3,t1);
    	
    	psmt.executeQuery();
    	out.println("<script>alert('Record updated....')</script>");
    }
    catch(Exception e)
    {
    	out.println(e.toString());
    }
     }// end of update
   
     
     
     
     if(btnval.equalsIgnoreCase("All search"))
     {
     	try
     	{
     		Class.forName("oracle.jdbc.driver.OracleDriver");
     		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("select * from job");
     		%>
     		<table border=5 bgcolor=#F9B174>
     		<tr>
     		            <th bgcolor=#FC1F58><font size=6>Job Id</th>
     		            <th bgcolor=#FC1F58><font size=6>Job Title</th>
     		            <th bgcolor=#FC1F58><font size=6>Salary</th>
     		    
     		    
     	   </tr>
     	   <%
     	   while(rs.next())
     	   {
     		%>
     		   <tr>
     		       <th><%=rs.getString(1)%></th>
     		       <th><%=rs.getString(2)%></th>
     		       <th><%=rs.getString(3)%></th>
     		      
     		       

     		  </tr>
     		  <%}%>
     		          <input type=button value="Print" onclick="window.print()">
     		  </table>
     	<%}	  
     	catch(Exception e)
         {
         	out.println(e.toString());
         }
     }//End of Allsearch
     		       

       if(btnval.equalsIgnoreCase("search")) 
       {
     	  try
     	  {
     		  Class.forName("oracle.jdbc.driver.OracleDriver"); 
     		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
     		  Statement smt=conn.createStatement();
     		  String t1=request.getParameter("t1");
     		  ResultSet rs=smt.executeQuery("select * from job where job_ID='"+t1+"'");
     		  %>
     		      <table border=3 bgcolor=#F9B174>
     		     <tr>
     		            <th bgcolor=#FC1F58><font size=6>Job Id</th>
     		            <th bgcolor=#FC1F58><font size=6>Job Title</th>
     		            <th bgcolor=#FC1F58><font size=6>Salary</th>
     		    
     		         
                    </tr>
                    <%  
                    while(rs.next())
             	   {
             		%>
             		   <tr>
             		       <th><%=rs.getString(1)%></th>
             		       <th><%=rs.getString(2)%></th>
             		       <th><%=rs.getString(3)%></th>
             		     
             		       
             		              
             		  </tr>
             	  <%}%>
             		       <input type=button value="Print" onclick="window.print()">
     		      </table>
          <%}
     	  catch(Exception e)
           {
           	out.println(e.toString());
           }
        }//End of Search
     %>

</body>
</html>