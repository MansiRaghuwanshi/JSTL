
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Insert title here</title>
   </head>
   <body>
      <h1>First Maven project and JSTL Sample</h1>
      <!--  c:out tag for displaying the result of an expression similar to < %=...% >-->
      <h2>JSTL Core Tag lib</h2>
      <c:out value="${'Welcome to JSTL'}"/>
      <p>
         <!--  c:forEach iterates over a collection of object-->
         <c:forEach var="count" begin="1" end="3">
            Using foreachLoop in JSTL
            <c:out value="${ count}"/>
         </c:forEach>
      </p>
      <!--  c:Set evaluates the expression and use the result to set a value of java.util.Map or JavaBean-->
      <c:set var="IncomingVariableFromBean" scope="session" value="${'Value you want to set'}"/>
      <c:out value="${IncomingVariableFromBean}"/>
      <br></br>
      <!-- JSTL Function Tag lib	 -->
      <h2>JSTL Function Tag lib</h2>
      <c:set var="String" value="Testing JSTL Contains"/>
      <c:if test="${fn:contains(String, 'Contains')}">
         <p>This will be displayed only if the string was found and function returns true </p>
         <c:out value="${test}"/>
      </c:if>
      <c:set var="SplittedString" value="${fn:split(String, 'i')}" />
      <p>Modified String : ${SplittedString}</p>
      ${fn:substring(String, 6, 11)}
      <!-- JSTL Formatting Tag lib	 -->
      <h2>JSTL Formatting Tag lib</h2>
      <c:set var="date" value="02-12-2018" />
      <fmt:parseDate value="${date}" var="dateParsed"  pattern="dd-MM-yyyy" />
      <p>
         <c:out value="${dateParsed}" />
      </p>
      <c:set var="dollorAmount" value="2000" />
      <p>
         Number Formatted as below :
         <fmt:formatNumber value="${dollorAmount}" type="currency" />
      </p>
      <!-- JSTL XMl Tag lib	 -->
      <h2>JSTL XML Tag lib</h2>
      <c:set var="books">
         <books>
            <book>
               <name>AED</name>
               <price>2000</price>
            </book>
            <book>
               <name>Web Tools</name>
               <price>2000</price>
            </book>
         </books>
      </c:set>
      <x:parse xml="${books}" var="result"/>
      <b>Name of the Book is</b>:
      <x:out select="$result/books/book[1]/name" />
      <br>
      <b>Price of the Book is</b>:
      <x:out select="$result/books/book[1]/price" />
      <!-- Stores the output of xml into a variable -->
      <x:parse xml="${books}" var="importedXmlOutput"/>
      <!--x:set:sets a variable with the value of an XPath expression  -->
      <x:set var="SetPrice" select="$importedXmlOutput/books/book[2]/price"/>
      <b>The price of the Web Tools book</b>:
      <x:out select="$SetPrice" />
      <!-- JSTL SQL Tag lib	 -->
      <h2>JSTL SQL Tag lib</h2>
      <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/film_club	"
         user="root"  password=""/>
   </body>
</html>

