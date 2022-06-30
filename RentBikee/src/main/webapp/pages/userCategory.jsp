<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 29.06.2022
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


    <link rel="stylesheet" type="text/css" href="css/userlistcs.css">
    <title>Title</title>
</head>
<body>

<h3 class="card-header text-center font-weight-bold text-uppercase py-4">
    Editable table
</h3>
<div class="card-body">
    <div id="table" class="table-editable">

        <table class="table table-bordered table-responsive-md table-striped text-center">
            <thead>

            <tr>
                <th class="text-center">User name</th>
                <th class="text-center">full name</th>
                <th class="text-center">phone number</th>
                <th class="text-center">balance</th>
                <th class="text-center">Status</th>
                <th class="text-center">edit</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.all_user}" var="user" >
                <tr>
                    <td>${user.username}</td>
                    <td>${user.fullname}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.balance}</td>
                    <c:if test="${user.block == true}">
                        <td>block</td>
                    </c:if>
                    <c:if test="${user.block == false}">
                        <td>active</td>
                    </c:if>

                    <td>
                        <div class="container">
                            <c:if test="${user.block == true}">
                                <form action="">
                                    <input type="hidden" name="command" value="activOrDeactive">
                                    <button type="submit" name="command" value="vl" class="btn" >ACTIVE</button>
                                </form>
                            </c:if>
                            <c:if test="${user.block == false}">
                                <form action="">
                                    <input type="hidden" name="command" value="activOrDeactive">
                                    <button type="submit" name="command" value="vl" class="btn" >deactive</button>
                                </form>
                            </c:if>
                            <form action="">
                                <input type="hidden" name="command" value="delete">
                                <button type="submit" class="btn1">DELETE</button>
                            </form>
                        </div>
                    </td>

                </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>
</div>

</body>
</html>
