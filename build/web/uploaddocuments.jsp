<%-- 
    Document   : profile
    Created on : 24 Jan, 2017, 12:07:29 PM
    Author     : BALA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UploadDocuments</title>
        <script>
            function validateform(){
            var a = document.forms["myform"]["aadhar"].value;
            var b = document.forms["myform"]["pan"].value;
            var c = document.forms["myform"]["kyc"].value;
            var d = document.forms["myform"]["kycurl"].value;
            var e = document.forms["myform"]["incometax"].value;
            var f = document.forms["myform"]["iturl"].value;
            var g = document.forms["myform"]["reason"].value;
            if(a==""){
                alert("Enter the Aadhar Number");
                return false;
            }
            if(b==""){
                alert("Enter the PanCard Number");
                return false;
            }
            if(c=="" && d==""){
                alert("Enter the KYC verfication");
                return false;
            }
            if(e=="" && f==""){
                alert("Enter the Income Tax verification");
                return false;
            }
            if(g==""){
                alert("Enter the reason");
                return false;
            }
            
        }
        </script>
        
        <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection">
   <link href="js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="js/plugins/chartist-js/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">

<style>
body {
    background: -webkit-linear-gradient(#);
  background: linear-gradient(#);
    background-size: cover;
    font-family: Montserrat;
}

.logo {
    width: 213px;
    height: 36px;
    background: url('') no-repeat;
    margin: 50px auto;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ae275f;
    margin: 0 auto;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}



.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block button on1{png
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ff7b81;
}
    but{
        color: aqua;
    }
    ul{
        
        background-color:#ae275f ;
        
        margin-top:8px;
    }
    

</style>

</head>

<body>
      <ul>
        <li style="margin-left:50px;margin-top:-10px;"><img src="axis.png" alt="axis logo"></li>
            
        
        </ul>
    
<div class="logo"></div>
<div class="login-block">
<center>
    <h1>UPLOAD DOCUMENTS</h1>
    <form action="uploadServlet" method="post" name="myform" onsubmit="return validateform()" enctype="multipart/form-data">
    <table>
        
          <tr>
            <td>AADHAR CARD NUMBER</td>
            <td><input type="text" name="aadhar"></td>
          </tr>
          <tr>
            <td>PAN CARD NUMBER</td>
            <td><input type="text" name="pan"></td>
          </tr>
          <tr>
            <td>KYC FORM</td>
            <td><input type="file" name="kyc"></td>
          </tr>
          <tr>
              <td>KYC URL</td>
              <td><input type="text" name="kycurl"></td>
          </tr>
          <tr>
            <td>INCOME TAX CERTIFICATE</td>
            <td><input type="file" name="incometax"></td>
          </tr>
          <tr>
              <td>INCOME WEBSITE URL</td>
              <td><input type="text" name="iturl"></td>
          </tr>
          <tr>
            <td>REASON FOR APPLYING LOAN</td>
            <td><textarea name="reason"></textarea></td>
          </tr>
          <tr>
              <td><a href="login.jsp"><button  style="background-color:#ae275f;"class="btn waves-effect waves-light" name="">CANCEL</button></a></td>
              <td><button  style="background-color:#ae275f;"class="btn waves-effect waves-light " type="submit" name="">UPLOAD</button></td>
          </tr>
    </table>
</form>
</div>
</center>

</body>
</html>
