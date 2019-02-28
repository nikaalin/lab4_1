<%--
  Created by IntelliJ IDEA.
  User: al
  Date: 23.01.2019
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>lab 4</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <script src="https://unpkg.com/vue@2.1.10/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <script>
        window.onload = function () {
             vue = new Vue({
                el: '#app',
                data: {
                    xValue: "  ",
                    rValue: "  ",
                    yValue: "  ",
                    x:"  ",
                    check: "",
                    items:[
                        {X: null, Y: null, R: null, result: null}
                    ],
                    fields: ['first_name', 'last_name', 'age'],
                    msg: ' '
                },
                methods: {
                    checkPoint: function () {

                        if (
                            (this.xValue < -3 || this.xValue > 5) || this.yValue == undefined||
                            this.rValue == undefined||this.xValue == undefined||
                            (this.yValue < -5 || this.yValue > 3) || (this.rValue < 1 || this.rValue > 4)||this.rValue<0
                        ) {
                            this.check = "inv operands";
                        } else {
                            if ( //прямоугольник
                                (this.xValue <= 0 && this.yValue <= 0 &&
                                    this.xValue >= -this.rValue && this.yValue >= -this.rValue/2) ||
                                //прямая
                                (this.xValue >= 0 && this.yValue <= 0 &&
                                    this.yValue >= (this.xValue/2 - (this.rValue / 2))) ||
                                //сектор
                                (this.xValue >= 0 && this.yValue >= 0 &&
                                    (this.xValue * this.xValue + this.yValue * this.yValue) <= this.rValue * this.rValue)
                            ) {
                                this.check = "true";
                            } else this.check = "false";
                        }
                    },
                    tableAdd: function () {
                        this.checkPoint();
                        this.items.push({X: this.xValue, Y: this.yValue, R: this.rValue, result: this.check});

                    },
                    savePoint: function () {
                        this.xValue = this.x;
                        this.tableAdd()
                    },
                    error : function () {
                        this.msg = 'График сжался в сингулярность'
                    },
                    graphok : function () { //где они юзаются тыкни плес
                        this.msg = ' ';
                    }
                }
            });
        draw('graph', 0);
        document.getElementById('y').innerHTML="<label>Y\n" +
            "                <input v-model=\"yValue\" name=\"yRadio\" class=\"border-primary rounded\" id=\"YText\" onkeydown = \"validateY()\" placeholder=\"(-3;3)\">\n" +
            "            </label>"
        }

    </script>


</head>
<body>
<div id="app" class="container ">
    <div class="row h-100">
        <div id="form" class="col-md-8 my-auto">
        <div id="left_part" class=" align-items-center border rounded">
    <div id="myForm" class="align-items-center " >
        <div class=" mx-auto center-block text-center"   id="x" data-toggle="buttons">
            X
            <label class="btn btn-primary">
                <input type="radio" name="xRadio" style="display: none;" id="option1" autocomplete="off" value =-5 v-model="x">-5
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option2" autocomplete="off" value =-4 v-model="x">-4
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option3" autocomplete="off" value =-3 v-model="x">-3
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option4" autocomplete="off" value =-2 v-model="x">-2
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option5" autocomplete="off" value =-1 v-model="x">-1
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option6" autocomplete="off" value =0 v-model="x"> 0
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option7" autocomplete="off" value =1 v-model="x"> 1
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option8" autocomplete="off" value =2 v-model="x"> 2
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="xRadio"  id="option9" autocomplete="off" value =3 v-model="x"> 3
            </label>
        </div>
        <div id="y" class="mx-auto center-block text-center">


        </div>
        <div id="r" class=" mx-auto center-block text-center " data-toggle="buttons">
            R
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"  autocomplete="off" value =-5 v-model="rValue" v-on:click="error">-5
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"   autocomplete="off" value =-4 v-model="rValue" v-on:click="error">-4
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"   autocomplete="off" value =-3 v-model="rValue" onclick="error()">-3
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"   autocomplete="off" value =-2 v-model="rValue" v-on:click="error">-2
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"   autocomplete="off" value =-1 v-model="rValue" v-on:click="error">-1
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"  autocomplete="off" value =0 v-model="rValue" v-on:click="error"> 0
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"  autocomplete="off" value =1 v-model="rValue" v-on:click="graphok"> 1
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"  autocomplete="off" value =2 v-model="rValue"  v-on:click="graphok"> 2
            </label>
            <label class="btn btn-primary">
                <input type="radio" name="rRadio"   autocomplete="off" value =3 v-model="rValue"  v-on:click="graphok"> 3
            </label>
        </div>
        <div id="submit" class="control-group error mx-auto center-block text-center" >
            <div   class="controls">
            <input type="button" class="btn btn-primary" value="Проверить"   v-on:click="savePoint" id="Checkbtn" ><br>
            <span class="help-inline" id="button_info" >{{msg}}</span>
            </div>
        </div>
    </div>
    </div>
    <div id="right_part" class=" border rounded">
    <div class="graph mx-auto center-block text-center" id="canvas" >
        <canvas height="400" width="400" id="graph"   onclick="interract('graph', vue.rValue)"
                class="graph"></canvas>

    </div>
    </div>
</div>

<div id="table" class="col-md-4 my-auto  border rounded ">
    <table class="table table-bordered table-hover table-striped " >
        <thead class="thead-default">
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Result</th>
        </tr>
        </thead>
        <tbody v-for="item in items" id="tablebody">
        <tr v-if="item.X">
            <td>{{item.X}}</td>
            <td>{{item.Y}}</td>
            <td>{{item.R}}</td>
            <td>{{item.result}}</td>
        </tr>
        </tbody>
    </table>
</div>
</div>
</div>
</body>

<script type="text/javascript" src="js/graph.js"></script>


</html>
