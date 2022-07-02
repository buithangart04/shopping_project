/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DAO;
import entity.Product;
import entity.ProductImage;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddProduct extends HttpServlet {

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
   
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AddProduct</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
       //  processRequest(request, response);
            response.setContentType("text/html;charset=UTF-8");
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
        //processRequest(request, response);
        DAO d = new DAO();
        String id = request.getParameter("id");
         int cate_id = Integer.parseInt(request.getParameter("select"));
        
        String name = request.getParameter("name");
        int  quantity_remain = Integer.parseInt(request.getParameter("quantity_remain")) ;
        int quantity_sell= 0;
        double oldprice =  Double.parseDouble(request.getParameter("oldprice"));
        int  sale = Integer.parseInt(request.getParameter("sale"));
        double price =oldprice/100*(100-sale);
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String description = request.getParameter("description");
        Product p= new Product(id, name, description, cate_id, quantity_remain, quantity_sell, sale, oldprice, price);
         ProductImage pi1= new ProductImage(id, 1,"images/"+image1);
         ProductImage pi2= new ProductImage(id, 2, "images/"+image2);
        if (d.checkProductExited(id)) {
            request.getSession().setAttribute("getAlert", "Yes");
            request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
        } else {
        if(request.getSession().getAttribute("getAlert")!=null) {
            request.getSession().removeAttribute("getAlert");
        }
       
         d.addProduct(p);
        
         d.addImageProduct(pi1);
          d.addImageProduct(pi2);
          request.getRequestDispatcher("home.jsp").forward(request, response);
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
