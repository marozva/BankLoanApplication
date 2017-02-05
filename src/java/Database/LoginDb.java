/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.DriverManager;
import java.sql.*;

/**
 *
 * @author BALA
 */
public class LoginDb {
    public static boolean validate(String accountno,String ifsc,String phnno){
        boolean boo = false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/axis_bank?zeroDateTimeBehaviour=convertToNull","root","1234");
            PreparedStatement ps = con.prepareStatement("select * from account where accountno=? and ifsc=? and phnno=?");
            ps.setString(1,accountno);
            ps.setString(2,ifsc);
            ps.setString(3,phnno);
            ResultSet rs = ps.executeQuery();
            boo = rs.next();
    }catch(Exception e){
    }
        return boo;
  }
}