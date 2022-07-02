/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DAO;
import entity.Bill;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Cart extends HttpServlet {

    int index;

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Cart</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
        HttpSession session = request.getSession();
        List<Bill> list = new ArrayList<>();
        DAO d= new DAO();
        if (session.getAttribute("listCart") != null) {
            list = (List<Bill>) session.getAttribute("listCart");
        }
        if (request.getParameter("option").equals("null") ) {

            String id = request.getParameter("id");
            String user_id = (String) session.getAttribute("userid");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double shipping_fee = 30;

            if (checkPro_idExist(list, id)) {
                list.get(getIndex()).setQuantity(list.get(getIndex()).getQuantity() + quantity);
            } else {
                Product p=d.searchProductById(id).get(0);
                Date date= Calendar.getInstance().getTime();
                SimpleDateFormat sp= new SimpleDateFormat("dd/MMM/yyyy");
                list.add(new Bill(id, user_id,p.getName(), quantity, shipping_fee,p.getPrice(),
                        p.getPrice()*quantity+shipping_fee,sp.format(date)));
            }

        } else if (request.getParameter("option").equals("remove")) {

            if (checkPro_idExist(list, request.getParameter("id"))) {
                list.remove(getIndex());
            }
        }
        session.setAttribute("listCart", list);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    public boolean checkPro_idExist(List<Bill> list, String id) {
        int j = 0;
        for (Bill b : list) {
            if (b.getPro_id().equals(id)) {
                setIndex(j);
                return true;
            }
            j++;
        }
        return false;
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

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

}
