<%-- 
    Document   : Insert
    Created on : Sep 15, 2017, 5:01:43 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="Kunal" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <style>
            #body
            {
                background-image: url("my.jpg");
            }
            #mainHeading
            {
                font-family: fantasy;
                font-size: 50px;
                color: burlywood;
                border: inset;
                background-color: brown;
                border-bottom-left-radius: 20px;
                border-bottom-right-radius:20px;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
            }
            #headings
            {
                font-family: sans-serif;
                font-size: 20px;
                color:black;
            }
        </style>
    </head>
    <body id="body">
    <center>  
 
        
        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
                           url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Salary;" 
                           user="vkunal1996" 
                           password="12345"/>  
        <Kunal:set var="rollnumber" value="${param['roll']}"/>
        <Kunal:set var="rollnumbernew" value="${param['newroll']}"/>
        <Kunal:set var="newname" value="${param['name']}"/>
        <Kunal:set var="newage" value="${param['age']}"/>
        
                         <sql:query dataSource="${db}" var="rs">
                            SELECT * from Record where Roll=?
                         <sql:param value="${rollnumber}"/>
                            </sql:query>
                        
                            
                            <Kunal:if test="${rs.rowCount!=0}">
                             <sql:update dataSource="${db}" var="my">
                              UPDATE Record SET Roll=?,Name=?,Age=? where Roll=?;
                            <sql:param value="${rollnumbernew}"/>
                            <sql:param value="${newname}"/>
                            <sql:param value="${newage}"/>
                            <sql:param value="${rollnumber}"/>
                             </sql:update>
                              <h1 id="mainheading">RollNumber Updated succesFully</h1>
                            </Kunal:if>
                            
                            <Kunal:if test="${rs.rowCount==0}">
                            <h1 id="mainheading">RollNumber don't Exists</h1>
                            </Kunal:if>
                            
        <h1 id="mainHeading">Details of All the Student</h1>
        <sql:query dataSource="${db}" var="rs">
            SELECT * FROM Record;
        </sql:query>
        <table border="2" width="100%">  
            <tr>    
            <th align="center">Roll Number</th>  
            <th align="center">Student Name</th>  
            <th align="center">Age</th>  
              
            </tr>  
            <Kunal:forEach var="table" items="${rs.rows}">  
            <tr>  
            <td align="center"><Kunal:out value="${table.Roll}"/></td>  
            <td align="center"><Kunal:out value="${table.Name}"/></td>  
            <td align="center"><Kunal:out value="${table.Age}"/></td>   
            </tr>  
            </Kunal:forEach>  
      
    </center>
        
        <br><form method="post"><input type="Submit" value="Home" formaction="index.html"></form>
    </body>
</html>
