$(document).ready(function () {
    $("#button").click(function () {
        var data = {"login": $('#login').val(), "password": $("#password").val()};
        $.ajax
        ({
            type: "POST",
            data: data,
            url: '/lab4/login',
            error: function(e)//Если запрос не удачен
            {
                document.getElementById("errMsg").innerText ="Ошибка обращения к серверу :с";
                document.getElementById("errMsg").visibility = "visible";
            },
            success: function (e) {
                   if (e == "true") {
                       document.getElementById("main_form").submit()
                   } else {
                       document.getElementById('errMsg').innerText = "Неверное имя пользователя и/или пароль";
                       document.getElementById('errMsg').visibility = "visible";
                   }

            }


        });
    });
});


