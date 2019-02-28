<%--
  Created by IntelliJ IDEA.
  User: al
  Date: 23.01.2019
  Time: 17:52
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

</head>

<div class="container h-100">
    <div class="row" id="first_div">
        <div class="col-md-3 mr-0.5  border rounded bg-white border-primary" >
            <h4  class="text-center"> Вариант 18155 <br>
                Группа P3201
            </h4>
        </div>
        <div class="col-md-6 ml-0.5 mr-0.5 border border-primary rounded bg-white">
            <h4 class="text-center">Балахонов Ярослав Ильич<br>
            Николаенкова Алина Алексеевнa
            </h4>
        </div>
        <div class="col-md-3 ml-0.5 border rounded bg-white border-primary">
            <h4 class="text-center">Логин: 1<br>
            Пароль: 1
            </h4>
        </div>
    </div>


    <div class="row justify-content-center align-items-center h-75" id="auth_form">

        <div class="col-md-12 text-center">
            <form method="post" class="div" action="main" id="main_form">
                <label for="login" >Логин:  </label><input class="border rounded bg-white border-primary" type="text" id="login" name="LOGIN"><br>
                <label for="password" >Пароль: </label><input type="password" class="border rounded bg-white border-primary" id="password" name="PASSWORD"><br>
                <input class="btn-primary border rounded custom" type="button" id="button" value="Вход">
                <div class="errMsg text-danger" id="errMsg"></div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
