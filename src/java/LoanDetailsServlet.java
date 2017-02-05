/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.io.PrintWriter;
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

/**
 *
 * @author BALA
 */
@WebServlet(urlPatterns = {"/LoanDetailsServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 *100)
public class LoanDetailsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoanDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoanDetailsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              //out.println("<body>");
        try {
              String loantype = request.getParameter("loantype");
              Part secure = request.getPart("sec");
              InputStream is = null;
              if(secure!=null){
                  is = secure.getInputStream();
              }
              String loanamt = request.getParameter("loanamount");
              String interest = request.getParameter("interest");
              String month = request.getParameter("monthins");
              HttpSession session = request.getSession(false);
              String num = (String) session.getAttribute("accountno");
              float p = Float.parseFloat(loanamt);
              float r = Float.parseFloat(interest);
              r = r/(12*100);
              float n = Float.parseFloat(month);
              int emi = (int) ((p*r*Math.pow(1+r,n))/(Math.pow(1+r,n)-1));
              int amount = (int) (emi * n);
              int principle = (int) p;
              int payable = amount - principle ;
              int totalamt = principle + payable;
              /*String loanamt = request.getParameter("loanamount");
              String interest = request.getParameter("interest");
              String monins = request.getParameter("monthins");
              Part security = request.getPart("security");
              InputStream is = null;
              if(security != null){
                  is = security.getInputStream();
              }
              int emi;
              float p = Float.parseFloat(loanamt);
              float r = Float.parseFloat(interest);
              r = r/(12*100);
              float n = Float.parseFloat(monins);
              emi = (int) ((p*r*Math.pow(1+r,n))/(Math.pow(1+r,n)-1));
              int amount = (int) (emi * n);
              int principle = (int) p;
              int payable = amount - principle ;
              int totalamt = principle + payable;*/
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/axis_bank?zeroDateTimeBehavior=convertToNull", "root", "1234");
            
            PreparedStatement ps = con.prepareStatement("insert into details (loantype,security,loanamount,interest,month,emi,payable,totalamt,accountno) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, loantype);
            if(is!=null){
                ps.setBlob(2, is);
            }
            ps.setString(3, loanamt);
            ps.setString(4, interest);
            ps.setString(5, month);
            ps.setInt(6, emi);
            ps.setInt(7, payable);
            ps.setInt(8, totalamt);
            ps.setString(9, num);
            int i = ps.executeUpdate();
            if( i > 0 ){
                RequestDispatcher rd = request.getRequestDispatcher("agreement.jsp");
                rd.forward(request,response);
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            }
        }catch(Exception e){
            
        }      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
