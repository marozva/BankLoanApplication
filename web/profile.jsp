<%-- 
    Document   : profile
    Created on : 24 Jan, 2017, 12:07:29 PM
    Author     : BALA
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <script>
        function validateForm() {
            var x = document.forms["myform"]["mi"].value;
            if (x=="") {
            alert("Enter the Monthly Income");
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
   
    <h1>PROFILE</h1>
    <form action="ProfileServlet" method="post"  onsubmit="return validateForm()" name="myform">
    <table>
        <input type="hidden" value="<%=request.getParameter("accountnum")%>" name="accountnumber">
        <%  
        String num = (String)session.getAttribute("accountno");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/axis_bank?zeroDateTimeBehaviour=convertToNull", "root", "1234");
        Statement stmt = con.createStatement();
        String sql="select * from account where accountno='"+num+"'";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
            String name = rs.getString("name");
            String accountnum = rs.getString("accountno");
            String type = rs.getString("type");
            String bran = rs.getString("branch");
            String code = rs.getString("ifsc");
            String dob = rs.getString("dob");
            String add = rs.getString("address");
            String occu = rs.getString("occupation");
            String date = rs.getString("open");
            String mob = rs.getString("phnno");
        
        %>
          <td><img src="image/<%=num%>.jpg" width="115" height="128" /></td>
          <tr>
            <td>NAME</td>
            <td><%=name%></td>
          </tr>
          <tr>
            <td>ACCOUNT NUMBER</td>
            <td><%=accountnum%></td>
          </tr>
          <tr>
            <td>ACCOUNT TYPE</td>
            <td><%=type%></td>
          </tr>
          <tr>
            <td>ACCOUNT BRANCH</td>
            <td><%=bran%></td>
          </tr>
          <tr>
            <td>IFSC CODE</td>
            <td><%=code%></td>
          </tr>
          <tr>
            <td>DATE OF BIRTH</td>
            <td><%=dob%></td>
          </tr>
          <tr>
            <td>ADDRESS</td>
            <td><%=add%></td>
          </tr>
          <tr>
            <td>OCCUPATION</td>
            <td><%=occu%></td>
          </tr>
          <tr>
              <td>MOBILE NUMBER</td>
              <td><%=mob%></td>
          </tr>
          <tr>
            <td>MONTHLY INCOME</td>
            <td><input type="text" name="mi"></td>
          </tr>
          <tr>
            <td>ACCOUNT OPENED ON</td>
            <td><%=date%></td>
          </tr>
      
                  <% } %>
    </table>
     
    <center><button  style="background-color:#ae275f;"class="btn waves-effect waves-light " type="submit" name="">CONFIRM</button></center>
    </form>

</div>
</center>

</body>
</html>
