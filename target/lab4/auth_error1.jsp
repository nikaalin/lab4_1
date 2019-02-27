<%--
  Created by IntelliJ IDEA.
  User: al
  Date: 23.01.2019
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/vue@2.1.10/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/auth.js"></script>
    <link rel="stylesheet" type="text/css" href="css/table.css"/>
</head>
<body>
<table width="100%" height="100%">

    <tr id="authors" height="13%" class="div">
        <td width="25%"> вариант 18155 <br>
            группа P3201
        </td>
        <td>
            Балахонов Ярослав Ильич<br>
            Николаенкова Алина Алексеевна
        </td>
        <td width="25%">
            Логин: 1<br>
            Пароль: 1
        </td>


    </tr>
    <tr id="auth_form">
        <td></td>
        <td >
            <form method="post" class="div" action="AuthServlet">
                <label for="login">Логин: </label><input type="text" id="login" name="LOGIN"><br>
                <label for="password">Пароль: </label><input type="password" id="password" name="PASSWORD"><br>
                <input type="submit" id="button" value="OK">
                <div class="errMsg" id="errMsg">Неверное имя пользователя и/или пароль</div>
            </form>
        </td>
        <td></td>
    </tr>
</table>

</body>
</html>
