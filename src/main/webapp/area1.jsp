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
    <link rel="stylesheet" type="text/css" href="css/table.css"/>
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
                        {point: 'x | y | r | result'}
                    ]
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
                        this.items.push({point: (this.xValue+ ' | '+ this.yValue +" | " + this.rValue + " | "+ this.check)})
                    },
                    savePoint: function () {
                        this.xValue = this.x;
                        this.tableAdd()
                    }
                }
            });

        }</script>
    <script type="text/javascript" src="js/graph.js"></script>

</head>
<body>
<div id="app">
<div id="form">
    <span id="left_part">
    <form action="check" method="post" id="myForm">
        <div id="x">
            X
            <label>
                <input type="radio" name="xRadio" value=-5 v-model="x">
                -5
            </label>
            <label>
                <input type="radio" name="xRadio" value=-4 v-model="x">
                -4
            </label>
            <label>
                <input type="radio" name="xRadio" value=-3 v-model="x">
                -3
            </label>
            <label>
                <input type="radio" name="xRadio" value=-2 v-model="x">
                -2
            </label>
            <br>
            <label>
                <input type="radio" name="xRadio" value=-1 v-model="x">
                -1
            </label>
            <label>
                <input type="radio" name="xRadio" value=0 v-model="x">
                0
            </label>
            <label>
                <input type="radio" name="xRadio" value=1 v-model="x">
                1
            </label>
            <label>
                <input type="radio" name="xRadio" value=2 v-model="x">
                2
            </label>
            <label>
                <input type="radio" name="xRadio" value=3 v-model="x">
                3
            </label>
        </div>
        <div id="y">
            <label>Y
                <input v-model="yValue" name="yRadio">
            </label>

        </div>
        <div id="r">
            R
            <label>
                <input type="radio" name="rRadio" value =-5 v-model="rValue">
                -5
            </label>
            <label>
                <input type="radio" name="rRadio" value=-4 v-model="rValue">
                -4
            </label>
            <label>
                <input type="radio" name="rRadio" value=-3 v-model="rValue">
                -3
            </label>
            <label>
                <input type="radio" name="rRadio" value=-2 v-model="rValue">
                -2
            </label>
            <br>
            <label>
                <input type="radio" name="rRadio" value=-1 v-model="rValue">
                -1
            </label>
            <label>
                <input type="radio" name="rRadio" value=0 v-model="rValue">
                0
            </label>
            <label>
                <input type="radio" name="rRadio" value=1 v-model="rValue">
                1
            </label>
            <label>
                <input type="radio" name="rRadio" value=2 v-model="rValue">
                2
            </label>
            <label>
                <input type="radio" name="rRadio" value=3 v-model="rValue">
                3
            </label>
        </div>
        <div id="submit" >
            <input type="button"  value="Проверить" v-on:click="savePoint">
        </div>
    </form>
    </span>
    <span id="right_part">
    <div class="graph" id="canvas" >
        <canvas height="400" width="400" id="graph" onload="interract('graph',0)" onclick="interract('graph', vue.rValue)"
                class="graph"></canvas>
    </div>
    </span>
</div>
<div id="table">
    <div v-for="item of items">
        {{item.point}}
    </div>

</div>
</div>
</body>
</html>
