<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <head>
    <title>User Management Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      <%@ include file="/css/styles.css" %>
    </style>
  </head>
</head>
<body>
<%@ include file="/WEB-INF/fragments/navigation.jsp" %>
<br>
<br>
<br>
<div class="container text-center">
  <h3>THE TABLE USERS</h3>
  <p>You can edit and delete users!</p>
  <%@ include file="/WEB-INF/fragments/group.jsp"%>
<br>
  <c:if test="${sessionScope.userRole.equals('ADMIN')}">
  <p>You can add new users! (manage)</p>
  <%@ include file="/WEB-INF/fragments/add-user.jsp"%>
  </c:if>
</div>
</body>
</html>