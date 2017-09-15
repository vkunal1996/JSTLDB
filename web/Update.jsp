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
        <h1 id="mainHeading">Update Form</h1>
        
        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
                           url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Salary;" 
                           user="vkunal1996" 
                           password="12345"/>       
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
       </table>  
            <br><br>
            <form method="post">
                <table>
                    <tr>
                        <th id="headings">Enter the Roll Number for Updation </th>
                        <td><input type="text" name="roll" size="25"></td>
                    </tr>
                    <tr>
                        <th id="headings">Enter the New Roll Number </th>
                        <td><input type="text" name="newroll" size="25"></td>
                    </tr>
                    <tr>
                        <th id="headings">Enter the New Name </th>
                        <td><input type="text" name="name" size="25"></td>
                    </tr>
                    <tr>
                        <th id="headings">Enter the new Age </th>
                        <td><input type="text" name="age" size="25"></td>
                    </tr>
                    <tr>
                        <td align="center"><form method="post"><input type="Submit" value="Home" formaction="index.html"></form></td>
                        <td  align="center"><input type="Submit" value="Update" formaction="Updated.jsp"></td>
                    </tr>
                </table>
            </form>
                       
    </center>
                         
    </body>
</html>
