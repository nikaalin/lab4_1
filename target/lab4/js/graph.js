function draw(canv, r) {
    var ctx = document.getElementById(canv).getContext("2d");

    ctx.clearRect(0, 0, 400, 400);

    //сектор
    ctx.beginPath();
    ctx.moveTo(200, 200);
    ctx.arc(200, 200, 140,  3*Math.PI/2, 0, false);
    ctx.closePath();
    ctx.strokeStyle = "darkcyan";
    ctx.fillStyle = "darkcyan";
    ctx.fill();
    ctx.stroke();

    //прямоугольник
    ctx.beginPath();
    ctx.rect(60, 200, 140, 70);
    ctx.closePath();
    ctx.strokeStyle = "darkcyan";
    ctx.fillStyle = "darkcyan";
    ctx.fill();
    ctx.stroke();

    //треугольник
    ctx.beginPath();
    ctx.moveTo(200, 200);
    ctx.lineTo(200, 270);
    ctx.lineTo(340, 200);
    ctx.lineTo(200, 200);
    ctx.closePath();
    ctx.strokeStyle = "darkcyan";
    ctx.fillStyle = "darkcyan";
    ctx.fill();
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(200, 380);
    ctx.lineTo(200, 20);
    ctx.lineTo(195, 25);
    ctx.lineTo(205, 25);
    ctx.lineTo(200, 20);
    ctx.closePath();
    ctx.strokeStyle = "black";
    ctx.fillStyle = "black";
    ctx.fill();
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(20, 200);
    ctx.lineTo(380, 200);
    ctx.lineTo(375, 195);
    ctx.lineTo(375, 205);
    ctx.lineTo(380, 200);
    ctx.closePath();
    ctx.strokeStyle = "black";
    ctx.fillStyle = "black";
    ctx.fill();
    ctx.stroke();

    ctx.beginPath();

    ctx.moveTo(270, 195);
    ctx.lineTo(270, 205);
    ctx.moveTo(340, 195);
    ctx.lineTo(340, 205);

    ctx.moveTo(195, 130);
    ctx.lineTo(205, 130);
    ctx.moveTo(195, 60);
    ctx.lineTo(205, 60);

    ctx.moveTo(130, 195);
    ctx.lineTo(130, 205);
    ctx.moveTo(60, 195);
    ctx.lineTo(60, 205);

    ctx.moveTo(195, 270);
    ctx.lineTo(205, 270);
    ctx.moveTo(195, 340);
    ctx.lineTo(205, 340);

    ctx.font = "14px Times New Roman";
    if (r == 0||r==null) {
        ctx.fillText("R", 340, 215);
        ctx.fillText("R/2", 270, 215);

        ctx.fillText("R", 215, 60);
        ctx.fillText("R/2", 215, 130);

        ctx.fillText("-R", 60, 215);
        ctx.fillText("-R/2", 130, 215);

        ctx.fillText("-R", 215, 340);
        ctx.fillText("-R/2", 215, 275);
    } else {
        ctx.fillText(r, 340, 215);
        ctx.fillText(r / 2, 270, 215);

        ctx.fillText(r, 215, 60);
        ctx.fillText(r / 2, 215, 130);

        ctx.fillText(-r, 60, 215);
        ctx.fillText(-(r / 2), 130, 215);

        ctx.fillText(-r, 215, 340);
        ctx.fillText(-(r / 2), 215, 275);
    }

    ctx.closePath();
    ctx.strokeStyle = "black";
    ctx.fillStyle = "black";
    ctx.stroke();

    ctx.font = "20px Times New Roman";
    ctx.fillText('Y', 210, 30);
    ctx.fillText('X', 370, 225);
}

function getMousePos(canvas, evt) {
    let rect = document.getElementById(canvas).getBoundingClientRect();
    return {
        x: evt.clientX - rect.left,
        y: evt.clientY - rect.top
    };
}
function drawError() {
    let rect = document.getElementById("canvas");
    rect.innerHTML = "<div class='errMsg'>График свернулся в себя и образовал сингулярность</div>"
}

function interract(canvas, r) {
    if(r>=0){
        let event = window.event;
        let pos = getMousePos(canvas, event);
        let x = Math.round(((pos.x - 200) * r) / 140 * 10) / 10;
        let y = Math.round(((-pos.y + 200) * r) / 140 * 10) / 10;
        vue.xValue=x;
        vue.yValue=y;
        vue.tableAdd();
        draw('graph', r);
        drawPoint('graph', x, y, r);
    }
}
function drawPoint(canv, x, y, r) {
    let ctx = document.getElementById(canv).getContext("2d");
    if (!(Math.abs(x / r) > 1.2 || Math.abs(y / r) > 1.2)) {
        ctx.beginPath();
        ctx.arc(Math.round(200 + ((x / r) * 140)),
            Math.round(200 - ((y / r) * 140)), 3, 0, Math.PI * 2);
        ctx.closePath();
        if(isInArea(r,x,y)=="true") {
            ctx.strokeStyle = "green";
            ctx.fillStyle = "green";
        }else{
            ctx.strokeStyle = "crimson";
            ctx.fillStyle = "crimson";
        }
        ctx.fill();
        ctx.stroke();
    }
}

function isInArea(r,x,y) {
    let check;
    if (
        (x < -3 || x > 5) ||
        (y < -5 || y > 3) || (r < 1 || r > 4)
    ) {
         check = "inv operands";
    } else {
        if ((x <= 0 && y <= 0 && x >= -r && y >= -(r/2)) || //прямоугольник
            (x >= 0 && y <= 0 && y >= (x/2 - (r / 2))) || //прямая
            (x >= 0 && y >= 0 && (x * x + y *y) <= r * r) //сектор
        ) {
            check = "true";
        } else  check = "false";
    }
    return check;
}

function validateY() {
    document.getElementById("YText").onkeypress = function (event) {
        if (event.keyCode === 13)
        {
            document.getElementById('Checkbtn').click();

        }
        if ((event.keyCode < 48 || event.keyCode > 57) && event.keyCode !== 127 && event.keyCode !== 46 && event.keyCode !== 45) {
            return false;
        }

    };
}