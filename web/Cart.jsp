<%-- 
    Document   : Cart
    Created on : Nov 8, 2020, 9:19:30 PM
    Author     : Admin
--%>

<%@page import="entity.Product"%>
<%@page import="dal.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .pic-1{
                width: 70px;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Bill> list = (ArrayList<Bill>) session.getAttribute("listCart");
            DAO d = new DAO();

        %>
        <div class="container">
            <h2>Cart</h2>


            <p>User :<%=session.getAttribute("userid")%></p>
            <table class="table table-hover">
                <thead>
                    <tr  class="table-primary">
                        <th>Product name</th>
                        <th>price </th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Product</th>
                        <th>Option</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Bill b : list) {
                            if (b.getUser_id().equals(session.getAttribute("userid"))) {
                                Product p = d.searchProductById(b.getPro_id()).get(0);
                    %>
                    <tr class="table-info">
                        <td><%=p.getName()%></td>
                        <td><%=p.getPrice()%></td>
                        <td><%=b.getQuantity()%></td>
                        <td><%=p.getPrice() * b.getQuantity()%></td>
                        <td> <a href="ProductDetail.jsp?id=<%=b.getPro_id()%>&cate_id=null">
                                <img class="pic-1" src="<%=d.getImageProduct(b.getPro_id(), 1).get(0).getSource()%>">

                            </a></td>
                            <td> <a href="cart?id=<%=b.getPro_id()%>&option=remove">
                                  <button type="button" class="btn btn-warning">Remove Product</button>
                            </a></td>  
                    </tr>  
                    <% }
           }%>
 <tr class="table-info">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td> </td>
                            <td> <a href="Bill.jsp?option=cart">
                                  <button type="button" class="btn btn-warning">Buy</button>
                            </a></td>  
                    </tr>  
                </tbody>
            </table>
        </div>

    </body>
</html>

