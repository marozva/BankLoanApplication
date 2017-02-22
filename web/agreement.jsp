<%-- 
    Document   : agreement
    Created on : 25 Jan, 2017, 4:42:19 PM
    Author     : BALA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agreement</title>
        <script async type="text/javascript" src="assets/js/all.1.3.js"></script>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


  
<style>
    * {
  box-sizing: border-box;
}

ol {
  font-family: "Lato", sans-serif;
  padding-left: 100px;
  margin: 50px auto;
  counter-reset: section;
}
ol li {
  padding-bottom: 40px;
  position: relative;
}
ol li:before {
  content: counters(section,".");
  counter-increment: section;
  position: absolute;
  font-size: 20px;
  font-weight: 900;
  left: -75px;
  top: 0;
  height: 50px;
  width: 50px;
  background:#ae275f ;
  color: white;
  border-radius: 50%;
  text-align: center;
  line-height: 50px;
  z-index: 50;
}
ol li:after {
  content: "";
  border-left: 1px solid black;
  height: 100%;
  position: absolute;
  top: 0;
  left: -50px;
  z-index: 0;
}
ol li:last-child:after {
  border: none;
}
 h2 {
  font-size: 30px;
  font-weight: 300;
  line-height: 1.4em;
  padding-bottom: 10px;
}
ol li p {
  font-size: 18px;
  line-height: 1.4em;
}
    a{
    font-size: 25px;
    
    }

    ul{
        
        background-color:#ae275f ;
        
    margin-top: 8px;
    }
  
    </style>
        <link href="assets/css/all.css" rel="stylesheet">
        <style>
            .hide{
                visibility: hidden
            }
            
        </style>
        <script>
            function validateform(){
                
                if(document.getElementById("agree").checked)
                { 
                    return true;
                }
                else 
                {
                    alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy');
                    return false;
                }
                
            }
        </script>
    </head>
    <body>
    <center>
        <h1>AGREEMENT</h1>
        <form action="agreementServlet" method="post" name="myform" onsubmit="return validateform()">
            <%
            String num = (String) session.getAttribute("accountno");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/axis_bank?zeroDateTimeBehavior=convertToNull", "root", "1234");
            Statement stmt = con.createStatement();
            String sql = "select emi,payable,totalamt from details where accountno='"+num+"'";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                int em =  rs.getInt("emi");
                int pay = rs.getInt("payable");
                int total = rs.getInt("totalamt");
            %>
            <h3><table>
            <tr>
                <td>LOAN EMI</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
                <td><%=em%></td>
            </tr>
            <tr>
                <td>TOTAL INTEREST</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%=pay%></td>
            </tr>
            <tr>
                <td>TOTAL AMOUNT</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><%=total%></td>
            </tr>
                </table></h3>
            <% } %>
    </center>
    <h2 style="margin-left:45px;">TERMS AND CONDITIONS</h2> 
    <ol>
      <li><p> The Personal Loan is offered at a rate of interest which is fixed across the tenure of the loan. Terms on which the loan is offered are stated in the loan agreement</p></li>
      
      <li><p> Please read the loan agreement carefully and ensure that key terms such as interest rates, processing fees, prepayment charges are clearly stated before you sign the agreement </p></li>
      <li><p>You can prepay the Personal Loan after 6 months of loan disbursement by giving a written instruction to the Bank </p></li>
      
<li><p>Interest on your Personal Loan account accrues on a daily basis and is payable in Equated Monthly Instalment (EMI) on the due date • You can pay your EMIs through Electronic Clearing System (ECS) or by setting up a Standing Instruction (SI) on your HSBC Bank account </li></p>
    
<li><p>You need to pay your EMI on the due date. Non-payment of EMI would impact, but will not be limited to: - Your credit rating (reporting to Credit Information Companies (CICs)) - This will have an impact on other credit facilities availed of from Axis Bank- The Bank may initiate recovery proceedings to recover the dues
     </p></li> 
    <li><p> Axis Bank will notify you of any changes in the terms and conditions of this product with prior notice of one month</li></p>
      <li><p> Personal Loan needs to be repaid in Equated Monthly Instalments (EMI). Bank would notify the applicant about the amount of the instalment and each instalment payment due date </p></li>
      <li><p> Instalment amount would comprise of principal and interest which are payable in Equated Monthly Instalments (EMI) as set out in the agreement </p></li>
<li><p> Applicant would be required to pay any balance owing to the Personal Loan account (after payment of all instalments) on the final payment date as notified by the Bank
</p></li>
  
</ol>
    <input type="checkbox" name="checkbox" value="check" id="agree" class="term" style="margin-left:45px;"/>&nbsp;&nbsp;&nbsp;<a>I have read and agree to the Terms and Conditions and Privacy Policy</a>
           <br> <img name="img" width="auto" height="100" id="pop" style="margin-bottom: 5px;"/>
           <br> <canvas id="myCanvas" width="auto" height="100" style="margin-bottom: 5px;margin-left:650px;"></canvas><a>(Click SAVE)</a><br>
            <a style="margin-bottom: 5px; margin-left:740px; " href="javascript:clean()" class="btn btn-success btn-sm"><strong>New</strong></a>
            <a id="save" style="margin-bottom: 5px; margin-left:50px;"  href="javascript:save()" class="btn btn-info btn-sm" onclick="tut()"><strong>Save</strong></a>

            <!-- <br><label class="control-label"> Pen Core Size</label>
                 <select name="pen_size" class="pen_size">
                    <option value="1" selected="selected">size 1</option>
                    <option value="2">size 2</option>
                    <option value="3">size 3</option>
                    <option value="4">size 4</option>
                    <option value="5">size 5</option>
                </select>
            <p>
                <label> Ink Colour
                    <input name="selectColor" class="color {pickerClosable:true}" value="000">
                </label>
            </p> -->
            <textarea id="area" class="hide"></textarea>
               
            <input type="hidden" id="word" name="signature" value="">
            <br>  <center><button  style="background-color:#ae275f;"class="btn waves-effect waves-light " type="submit" name="">APPLY</button></center> 
        </form>
 
            <center>
            <script type="text/javascript" src="assets/js/DrawPaintScript.js"></script>

<script>

    
    function tut(){
        var cg=document.getElementById("pop");
        var c=document.getElementById("myCanvas");
        
        //var l="data:image/octet-stream;base64,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";
        //cg.src=l;
        cg.src=canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
        document.getElementById("word").value = cg.src;
  
        if(c.getContext){            
            var ctx=c.getContext("2d");
            cg.src=c.toDataURL("image/png");
        }
//        
        var a=document.getElementById("area");
        a.value=canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
        //Canvas2Image.saveAsPNG(c);
    }
    
</script>
            
            
    </body>
</html>
