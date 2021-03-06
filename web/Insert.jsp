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
        <h1 id="mainheading">Result</h1>
        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
                           url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Salary;" 
                           user="vkunal1996" 
                           password="12345"/>
       
        
        <Kunal:set var="rollnumber" value="${param['roll']}"/>
        <sql:query dataSource="${db}" var="rs">
           SELECT * from Record where Roll=?
           <sql:param value="${rollnumber}"/>
        </sql:query>
           
            <Kunal:if test="${rs.rowCount==0}">
                <sql:update dataSource="${db}" var="my">
                INSERT INTO RECORD (Roll,Name,Age) values(?,?,?);
                <sql:param value="${param['roll']}"/>
                <sql:param value="${param['name']}"/>
                <sql:param value="${param['age']}"/>
                </sql:update>
                <h1 id="mainHeading">Data inserted</h1>
            </Kunal:if>
                
                <Kunal:if test="${rs.rowCount!=0}">
                    <h1 id="mainHeading">Student already Exists</h1>
                </Kunal:if>   
        
        <h1 id="mainheading">Details of All the Student</h1>
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
       </table>  
    <br><br><br><br><br><br><form method="post"><input type="Submit" value="Home" formaction="index.html"></form>
    </center>
        
    </body>
</html>
