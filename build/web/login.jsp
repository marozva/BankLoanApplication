<%-- 
    Document   : login
    Created on : 24 Jan, 2017, 11:50:36 AM
    Author     : BALA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login</title>
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
    <h1>LOGIN</h1>

    <form action="LoginServlet" method="post">
    <input type="text" placeholder="ACCOUNT NUMBER" name="accountno"/>
    <input type="text" placeholder="IFSC CODE" name="ifsc"/>
    <input type="tel" placeholder="MOBILE NUMBER" name="phnno"/>
    <center><button  style="background-color:#ae275f;"class="btn waves-effect waves-light " type="submit" name="">CONFIRM</button></center>
    </form>

</div>
</body>
</html>
