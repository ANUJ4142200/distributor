<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.*"%>
<%
    String btnval=request.getParameter("b1");
     if(btnval.equalsIgnoreCase("save"))
     {
    	String t1=request.getParameter("t1");
    	String t2=request.getParameter("t2");
    	String t3=request.getParameter("t3");
    	String t4=request.getParameter("t4");
    	String t5=request.getParameter("t5");
    	String t6=request.getParameter("t6");
    int f=0;
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
    	Statement smt=conn.createStatement();
    	ResultSet rs=smt.executeQuery("select*from product where id='"+t1+"'");
    	while(rs.next())
    	{
    		if(rs.getString(1).equals(t1))
    		{
    			f=1;
    			break; 
    		}
    	}
    	if(f==0)
    	{	
        PreparedStatement psmt=conn.prepareStatement("insert into product values(?,?,?,?,?,?)");
    	psmt.setString(1,t1);
    	psmt.setString(2,t2);
    	psmt.setString(3,t3);
    	psmt.setString(4,t4);
    	psmt.setString(5,t5);
    	psmt.setString(6,t6);
    	psmt.executeQuery();
    	out.println("<script>alert('Record saved....')</script>");
    }
    	else
    	{
    		out.println("<script>alert('ID ALREADY EXIST...')</script>");
    	}
    }	
    catch(Exception e)
    {
    	out.println(e.toString());
    }
    }//End of save
     
     
     if(btnval.equalsIgnoreCase("Delete"))
     {
   	  try
   	 {	
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
       	PreparedStatement psmt=conn.prepareStatement("delete from product where id=?");
       	psmt.executeQuery();
   		out.println("<script>alert('Record deleted....')</script>");
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
     	 String t6=request.getParameter("t6");
     	 
     	 try
         {
         	Class.forName("oracle.jdbc.driver.OracleDriver");
         	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
            PreparedStatement psmt=conn.prepareStatement("update product set name=?,descr=?, qty_stock=?,price=?,category_id=? where id=?");
            psmt.setString(1,t2);
            psmt.setString(2,t3);
            psmt.setString(3,t4);
            psmt.setString(4,t5);
            psmt.setString(5,t6);
            psmt.setString(6,t1);
            psmt.executeQuery();
         	out.println("<script>alert('Record Updated....')</script>");
     	 
     }
     
     catch(Exception e)
     {
     	out.println(e.toString());
     }
     }//End of update
   
    
     if(btnval.equalsIgnoreCase("All search"))
     {
     	try
     	{
     		Class.forName("oracle.jdbc.driver.OracleDriver");
     		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "distributor","distributor");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("select * from product");
     		%>
     		<table border=1 bgcolor=#04FEB2>
     		<tr>
     		    <th bgcolor=#129E73><font size=6>Id</th>
     		    <th bgcolor=#129E73 ><font size=6>Name</th>
     		    <th bgcolor=#129E73 ><font size=6>Description</th>
     		    <th bgcolor=#129E73 ><font size=6>Quantity Stock</th>
     		    <th bgcolor=#129E73 ><font size=6>Price</th>
     		    <th bgcolor=#129E73 ><font size=6>Category Id</th>
     		    
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
     		       <th><%=rs.getString(6)%></th>

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
     		  ResultSet rs=smt.executeQuery("select * from product where ID='"+t1+"'");
     		  %>
     		      <table border=5 bgcolor=#80ffaa>
     		      <tr>
     		           <th bgcolor=#009973><font size=6>Id</th>
     		           <th bgcolor=#009973><font size=6>Name</th>
     		           <th bgcolor=#009973><font size=6>Description</th>
     		           <th bgcolor=#009973><font size=6>Quantity Stock</th>
     		           <th bgcolor=#009973><font size=6>Price</th>
     		           <th bgcolor=#009973><font size=6>Category Id</th>
     		         
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
             		       <th><%=rs.getString(6)%></th>
             		              
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