var canvas = null;
var context = null;
var mouseX = 0;
var mouseY = 0;
var startX = 0;
var startY = 0;
var offset = 0;
var isDrawToolSelected = true;
var isColorSelected = true;
var isEraserSelected = false;
var deselectMsg = '';
var lineWidth = 1;
var width = 0;
var height = 0;
var curColor = '#000';
var curDrawingTool = 'Pencil';
var mouseDown = false;
//var curFont = 'arial'; 
//var curFontSize = '20px';

function getContext(canvasId)
{
    canvas = document.getElementById(canvasId);
    if (canvas.getContext) {
        context = canvas.getContext('2d');
    }
    else {
        alert('update or change your browser to use the drawing board');
    }
}


function drawLine(fromX, fromY, toX, toY) {
    context.lineWidth = lineWidth;
    context.strokeStyle = curColor;
    context.beginPath();
    context.moveTo(fromX, fromY);
    context.lineTo(toX, toY);
    context.stroke();
}

function beginLine(fromX, fromY)
{
    context.lineWidth = lineWidth;
    context.strokeStyle = curColor;
    context.lineCap = 'round';
    context.beginPath();
    context.moveTo(fromX, fromY);
}

function continueLine(toX, toY)
{
    context.lineTo(toX, toY);
    context.stroke();
}


$(document).ready(function()
{
    getContext('myCanvas');
    offset = $('#myCanvas').offset();
    $('#selectDraw').val('0');
    $('#selectColor').val('0');

    $('.ToolsSettingsContainer [type=radio]').attr('checked', false);
    $('.ToolsSettingsContainer').hide();


    $('#selectDraw').change(function()
    {
        curDrawingTool = $('#selectDraw option:selected').val();
        if (!curDrawingTool || curDrawingTool == '0') {
            isDrawToolSelected = false;
            return false;
        }
        else
        {
            if (curDrawingTool == 'Line' || curDrawingTool == 'Pencil')
            {
                $('.ToolsSettingsContainer').slideDown('slow');
            }
            isDrawToolSelected = true;
        }
    });
    $(".pen_size").change(function() {
        lineWidth = $(this).val();
    });

    $('#eraser').click(function(e)
    {
        curColor = '#FFF';
        isEraserSelected = true;
        $("#myCanvas").css('cursor', 'url("http://www.signaturemaker.in/assets/ico/eraser.png"),auto');
        e.preventDefault();
    });

    $('#UnEraserLink').click(function(e) {
        e.preventDefault();
        isEraserSelected = false;
        $("#myCanvas").css('cursor', 'url("http://www.signaturemaker.in/assets/ico/pen.png"),auto');
        curColor = $('[name="selectColor"]').val();
        curDrawingTool = "Pencil";
    });

    $('[name="selectColor"]').change(function()
    {

        curColor = "#" + $('[name="selectColor"]').val();
        if (!curColor || curColor == '0')
        {
            isColorSelected = false;
            return false;
        }
        else
        {
            isColorSelected = true;
        }
    });

    $('#myCanvas').mousedown(function(e)
    {
        mouseDown = true;
        if (isDrawToolSelected && isColorSelected || isEraserSelected)
        {
            startX = e.pageX - offset.left;
            startY = e.pageY - offset.top;
            if (curDrawingTool == 'Pencil' || isEraserSelected)
            {
                beginLine(startX, startY);
                //saveState(canvas);
            }

            else if (curDrawingTool == 'Text')
            {
                var textToDraw = $('#txtArea').val();
                if (textToDraw)
                {
                    drawText(textToDraw, startX, startY);
                }
                else
                {
                    drawText('Type some text in the text area', startX, startY);
                }
            }
        }
        else {
            mouseDown = false;
            alert('please select a drawing tool and/or a color before drawing');
            return false;
        }
    });
    $('#myCanvas').mousemove(function(e)
    {
        if (mouseDown)
        {
            mouseX = e.pageX - offset.left;
            mouseY = e.pageY - offset.top;
            width = Math.abs(mouseX - startX);
            height = Math.abs(mouseY - startY);
            if (curDrawingTool == 'Pencil' || isEraserSelected)
            {
                continueLine(mouseX + 1, mouseY + 1);

            }
        }
        else
        {
            return false;
        }
    });
    $('#myCanvas').mouseup(function(e)
    {
        mouseDown = false;
        historySave();
        return false;
    });

    $('#clearLink').click(function() {
        clear();
        return false;
    });

});


var undoRedo = new Array();
var unStep = -1;

function historySave() {
    unStep++;
    while (undoRedo.length > 20) {
        undoRedo.shift();
        unStep--;
    }
    if (unStep !== 0 && unStep < undoRedo.length) {
        undoRedo.length = unStep;
        unStep++;
    } else {
        undoRedo.length = unStep;
    }
    undoRedo.push(document.getElementById('myCanvas').toDataURL());
}

function Undo() {
    //alert("fgh");
    //alert(undoRedo[unStep]);
    if (unStep > -1) {
        unStep--;
        var canvasPic = new Image();
        canvasPic.src = undoRedo[unStep];
        canvasPic.onload = function()
        {
            context.clearRect(0, 0, 500, 200);
            context.drawImage(canvasPic, 0, 0, 500, 200, 0, 0, 500, 200);
        }
    }
}

function Redo() {
    if (unStep < undoRedo.length - 1) {
        unStep++;
        var canvasPic = new Image();
        canvasPic.src = undoRedo[unStep];
        canvasPic.onload = function() {
            context.drawImage(canvasPic, 0, 0);
        }
    }
}
function clean()
{
    //alert("dgf");
    context.clearRect(0, 0, 500, 200);
}