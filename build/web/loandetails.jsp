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
        <title>LoanDetails</title>
        <script>
            function validateform(){
                var a = document.forms["myform"]["sec"].value;
                if(a==""){
                    alert("Upload the Security File");
                    return false;
                }
            }
        </script>

</head>

<body>
<center>
    <h1>LOAN DETAILS</h1>
    <form action="LoanDetailsServlet" method="post" name="myform" onsubmit="return validateform()" enctype="multipart/form-data">
        <table>
        </tr>
          <tr>
            <td>TYPE OF LOAN</td>
            <td><select name="loantype">
                                    <option value="Home Loan">Home Loan</option>
                                    <option value="Car Loan">Car Loan</option>
                                    <option value="Personal Loan">Personal Loan</option>
                                </select></td>
          </tr>
          <tr>
            <td>SECURITY</td>
            <td><input type="file" name="sec"></td>
          </tr>
          <tr>
            <td>LOAN AMOUNT</td>
            <td><select name="loanamount">
                                    <option value="500000">500000</option>
                                    <option value="600000">600000</option>
                                    <option value="700000">700000</option>
                                </select></td>
          </tr>
          <tr>
            <td>INTEREST</td>
            <td><select name="interest">
                                    <option value="5">5%</option>
                                    <option value="6">6%</option>
                                    <option value="7">7%</option>
                                </select></td>
          </tr>
          <tr>
            <td>NUMBER OF MONTHLY INSTALMENT</td>
            <td><select name="monthins">
                                    <option value="12">12</option>
                                    <option value="24">24</option>
                                    <option value="36">36</option>
                                    <option value="60">60</option>
                                </select></td>
          </tr>
        
    </table>
     <input type="submit" value="CONTINUE">
</form>
</center>

</body>
</html>
