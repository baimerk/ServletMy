<div class="container">
    <table class="table caption-top">
        <caption>List of Users</caption>
        <thead class="table-dark">
        <tr>
            <th class="text-center" scope="col">#</th>
            <th class="text-center" scope="col">ID</th>
            <th class="text-center" scope="col">NAME</th>
            <th class="text-center" scope="col">LAST NAME</th>
            <th class="text-center" scope="col">ADDRESS</th>
            <th class="text-center" scope="col">IS MARRIED</th>
            <c:if test="${sessionScope.userRole.equals('ADMIN')}">
                <th class="text-center" scope="col">ACTION</th>
            </c:if>
        </tr>
        </thead>
        <c:forEach var="user" items="${requestScope.listUser}" varStatus="st">
            <tr>
                <th class="text-center align-middle" scope="row">${st.index}</th>
                <td class="text-center align-middle">${user.id}</td>
                <td class="text-center align-middle">${user.name}</td>
                <td class="text-center align-middle">${user.lastName}</td>
                <td class="text-center align-middle">${user.address}</td>
                <td class="text-center align-middle">${user.married}</td>
                <c:if test="${sessionScope.userRole.equals('ADMIN')}">
                    <td class="text-center align-middle">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="edit?id=${user.id}" class="btn btn-primary1" role="button">Edit</a>
                            <a href="delete?id=${user.id}" class="btn btn-secondary" role="button">Delete</a>
                        </div>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</div>
