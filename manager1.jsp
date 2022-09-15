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
    	String t4=request.getParameter("t4");
    	String t5=request.getParameter("t5");
    	
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
        PreparedStatement psmt=conn.prepareStatement("insert into manager values(?,?,?,?,?)");
    	psmt.setString(1,t1);
    	psmt.setString(2,t2);
    	psmt.setString(3,t3);
    	psmt.setString(4,t4);
    	psmt.setString(5,t5);
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
        PreparedStatement psmt=conn.prepareStatement("delete from manager where location_id=?");
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
    	String t4=request.getParameter("t4");
    	String t5=request.getParameter("t5");
   
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
        PreparedStatement psmt=conn.prepareStatement("update manager set fnm=?, lnm=?, email=?, phone=? where location_id=?");
    	psmt.setString(1,t1);
    	psmt.setString(2,t2);
    	psmt.setString(3,t4);
    	psmt.setString(4,t5);
    	psmt.setString(5,t3);
    	
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
     		ResultSet rs=smt.executeQuery("select * from manager");
     		%>
     		<table border=1 bgcolor=#83F47D>
     		<tr>
     		    <th bgcolor=#C8A7FA><font size=6>First Name</th>
     		    <th bgcolor=#C8A7FA><font size=6>Last Name</th>
     		    <th bgcolor=#C8A7FA><font size=6>Location Id</th>
     		    <th bgcolor=#C8A7FA><font size=6>Email</th>
     		    <th bgcolor=#C8A7FA><font size=6>Phone Number</th>
     		    
     		    
     	   </tr>
     	   <%
     	   while(rs.next())
     	   {
     		%>
     		   <tr>
     		       <th><%=rs.getString(1)%></th>
     		       <th><%=rs.getString(2)%></th>
     		       <th><%=rs.getString(3)%></th>
     		       <th><%=rs.getString(4)%></th>
     		       <th><%=rs.getString(5)%></th>
     		       

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
     		  ResultSet rs=smt.executeQuery("select * from manager where location_ID='"+t1+"'");
     		  %>
     		      <table border=5 bgcolor=#83F47D>
     		      <tr>
     		           <th bgcolor=#C8A7FA><font size=6>First Name</th>
     		           <th bgcolor=#C8A7FA><font size=6>Last Name</th>
     		           <th bgcolor=#C8A7FA><font size=6>Location Id</th>
     		           <th bgcolor=#C8A7FA><font size=6>Email</th>
     		           <th bgcolor=#C8A7FA><font size=6>Phone Number</th> 
     		         
                    </tr>
                    <%  
                    while(rs.next())
             	   {
             		%>
             		   <tr>
             		       <th><%=rs.getString(1)%></th>
             		       <th><%=rs.getString(2)%></th>
             		       <th><%=rs.getString(3)%></th>
             		       <th><%=rs.getString(4)%></th>
             		       <th><%=rs.getString(5)%></th>
             		       
             		              
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