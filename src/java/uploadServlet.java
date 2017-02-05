 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 *100)    
public class uploadServlet extends HttpServlet {
     
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
   
        String aadharcard = request.getParameter("aadhar");
        String pancard = request.getParameter("pan");
        String kyapp = request.getParameter("kycurl");
        String itweb = request.getParameter("iturl");
        InputStream inputStream = null; 
        InputStream inputStream1 = null; 
        
        Part filePart = request.getPart("kyc");
        Part filePart1 = request.getPart("incometax");
        String reason = request.getParameter("reason");
        HttpSession session = request.getSession(false);
        String num = (String) session.getAttribute("accountno");
        if (filePart != null && filePart1 != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType()); 
            
            inputStream = filePart.getInputStream();
            inputStream1 = filePart1.getInputStream();
        }
         
        Connection conn = null; 
        String message = null;  
         
        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/axis_bank?zeroDateTimeBehaviour=convertToNull", "root", "1234");
            int row;
            String sql = "INSERT INTO upload (aadharcard, pancard, kycform, form16, reason, accountno, kyapp, itweb) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, aadharcard);
            statement.setString(2, pancard);
            statement.setString(5, reason);
            statement.setString(6, num);
            statement.setString(7, kyapp);
            statement.setString(8, itweb);
            if (inputStream != null && inputStream1 != null) {
                statement.setBlob(3, inputStream);
                statement.setBlob(4, inputStream1);
            }
 
            row = statement.executeUpdate();
            if (row > 0) {
             RequestDispatcher rd = request.getRequestDispatcher("loandetails.jsp");
             rd.forward(request,response);
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("uploaddocuments.jsp");
                rd.include(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
}