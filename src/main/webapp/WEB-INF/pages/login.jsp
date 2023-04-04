<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>LOGIN</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/fragments/navigation.jsp" %>
<br>
<br>
<br>
<div class="container-fluid">
  <h2 class="text-center">Log in Form:</h2>
  <div class="row justify-content-center">
    <form class="col-6 needs-validation" action="${pageContext.request.contextPath}/base/loginAction" method="post" novalidate>
      <div class="mb-3">
        <label for="inputLogin" class="form-label">Login</label>
        <input type="text" class="form-control" name="login" id="inputLogin" required>
      </div>
      <div class="mb-3">
        <label for="inputPassword" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="inputPassword" required>
      </div>
      <c:if test="${requestScope.invalidLoginOrPassword == true}">
        <p class="text-start text-danger">Invalid login or password. Please try again.</p>
      </c:if>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button type="submit" class="btn btn-primary">Log in</button>
      <p class="mb-5 pb-lg-2">Don't have an account? <a class="text-decoration-none" href="${pageContext.request.contextPath}/base/registration">Register here</a></p>
    </form>
    <script>
      <%@ include file="/js/validation.js" %>
    </script>
  </div>
</div>
</body>
</html>
