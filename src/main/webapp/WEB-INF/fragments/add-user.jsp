<form class="col-6 needs-validation" action="${pageContext.request.contextPath}/base/addQ" novalidate method="post">
    <div class="container">
        <table class="table caption-top">
            <thead class="table-success">
            <tr>
                <td class="text-center align-middle">
                    <label for="inputName" class="form-label">First Name</label>
                    <input type="text" class="form-control" name="name" id="inputName" required></td>
                <td class="text-center align-middle">
                    <label for="inputLastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lastName" id="inputLastName" required></td>
                <td class="text-center align-middle">
                    <label for="inputAddress" class="form-label">Address</label>
                    <input type="text" class="form-control" name="address" id="inputAddress" required></td>
                <td class="text-center align-middle">
                    <label for="inputLogin" class="form-label">Login</label>
                    <input type="text" class="form-control" name="login" id="inputLogin" required></td>
                <td class="text-center align-middle">
                    <label for="inputPassword" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="inputPassword" required></td>
                <div class="mb-4">
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
                    <td class="text-center align-middle">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="submit" class="btn btn-primary1">Add user</button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>
                    </td>
            </tr>
            </thead>
        </table>
    </div>
</form>
