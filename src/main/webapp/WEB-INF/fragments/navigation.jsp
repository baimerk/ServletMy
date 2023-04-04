<nav class="navbar navbar-default navbar-dark bg-dark navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a href="${pageContext.request.contextPath}/base/" class="navbar-brand">
        <img src="https://1.downloader.disk.yandex.ru/preview/85fb4694e7086ee29207df1954f6972c6e26ed5f0feb6d51ce12e89090dee849/inf/JRFxS9rSwYaIHmYjWtdZcdJaYDCd3hdAGSn9aqpcCXKtjnsM50-7DSwQB-NybUeFVmmnAW7nNjo_qbbrfXw5uA%3D%3D?uid=412960111&filename=Logo2.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=412960111&tknv=v2&size=3677x2032" alt="Logo2" height="35" >
      </a>
      <c:if test="${sessionScope.user !=null}"> <!--Как то сложно, ладно. Здесь используется код определения доступа -->
        <a>Hello ${sessionScope.user.name}</a>
        <a>You access ${sessionScope.user.role}</a>
      </c:if>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${sessionScope.user !=null}">
          <li><a href="${pageContext.request.contextPath}/base/logoutAction">LOGOUT</a></li>
        </c:if>
        <c:if test="${sessionScope.user ==null}">
          <li><a href="${pageContext.request.contextPath}/base/login">LOGIN</a></li>
        </c:if>
        <li class="dropdown"><a class="dropdown" data-toggle="dropdown" href="#">CATALOG
          <span class="carret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/base/cabinetUserEdit">Users Edit</a></li>
            <!--<li><a href="${pageContext.request.contextPath}/list-of-reels/">Fishing Reels</a></li> -->
            <!-- <li><a href="#">Good assemblies experience</a></li> -->
            <c:if test="${sessionScope.user.role == 'ADMIN' or sessionScope.user.role =='USER'}">
              <li><a href="${pageContext.request.contextPath}/base/cabinet">My Cabinet</a></li>
            </c:if>
          </ul>
        </li>
        <li><a href="#band">SERVICE</a></li>
        <li><a href="#tour">TECHNOLOGIES</a></li>
        <li><a href="${pageContext.request.contextPath}/base/contact">CONTACT</a></li>
        <c:if test="${sessionScope.user.role == 'ADMIN' or sessionScope.user.role =='SPECIALIST'}">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
              <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${pageContext.request.contextPath}/list-of-rods/list-rods">Rods management</a></li>
              <li><a href="${pageContext.request.contextPath}/list-of-reels/list-reels">Reels management</a></li>
              <li><a href="${pageContext.request.contextPath}/base/users">Users management</a></li>
            </ul>
          </li>
          <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>