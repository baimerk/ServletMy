<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Registration page</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<br>
<br>
<br>
<div>
  <%@ include file="/WEB-INF/fragments/navigation.jsp" %>
</div>
<div class="container">
  <h2 class="text-center">Register Form:</h2>
  <div class="row justify-content-center">
    <form class="col-6 needs-validation" action="${pageContext.request.contextPath}/base/add" novalidate method="post">
      <div class="mb-3">
        <label for="inputName" class="form-label">First Name</label>
        <input type="text" class="form-control" name="name" id="inputName" required>
        <div class="invalid-feedback">
          Please input First Name.
        </div>
      </div>
      <div class="mb-3">
        <label for="inputLastName" class="form-label">Last Name</label>
        <input type="text" class="form-control" name="lastName" id="inputLastName" required>
        <div class="invalid-feedback">
          Please input Last Name.
        </div>
      </div>
      <div class="mb-3">
        <label for="inputAddress" class="form-label">Address</label>
        <input type="text" class="form-control" name="address" id="inputAddress" required>
        <div class="invalid-feedback">
          Please input Address.
        </div>
      </div>
      <div class="mb-3">
        <label for="inputLogin" class="form-label">Login</label>
        <input type="text" class="form-control" name="login" id="inputLogin" required>
      </div>
      <div class="invalid-feedback">
        Please input Login.
      </div>
      <div class="mb-3">
        <label for="inputPassword" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="inputPassword" required>
      </div>
      <div class="mb-3">
        Are you married?
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="isMarried" id="inlineRadio1" value="true">
          <label class="form-check-label" for="inlineRadio1">True</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="isMarried" id="inlineRadio2" value="false"
                 checked>
          <label class="form-check-label" for="inlineRadio2">False</label>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Register</button>
      <button type="reset" class="btn btn-secondary">Reset</button>
    </form>
    <script>
      <%@ include file="/js/validation.js" %>
    </script>
  </div>
</div>
<!--   Core JS Files   -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>