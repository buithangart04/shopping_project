<%-- 
    Document   : ViewBill
    Created on : Nov 10, 2020, 10:05:51 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
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
            body{
                background-color: #76b1eb;
            }
        </style>
    </head>
    <body>
       
        <div class="container">
            <h2 style="text-align: center;color: #072644 ; font-weight: 700;margin: 50px 0;">View Payment Bill</h2>


        <%if(request.getSession().getAttribute("account").equals("user")) { %>
            <h3>User :<%=session.getAttribute("userid")%></h3> 
       <% } %>
            
            <table class="table table-hover">
                <thead>
                    <tr  class="table-primary">
                        <th>User Name</th>
                        <th>Product name</th>
                        <th>price </th>
                        <th>Quantity</th>
                         <th>Shipping fee</th>
                        <th>Total</th>
                        <th>Date</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <% List<Bill> list = (List<Bill> )session.getAttribute("listViewBill");
                    for(int i=0;i<list.size();i++){ 
                      Bill b= list.get(i);
                    %>
                       <tr class="table-info">
                           <td><%=b.getUser_id() %></td>
                              <td><%=b.getName() %></td>
                                 <td><%=b.getPrice() %></td>
                                    <td><%=b.getQuantity() %></td>
                                     <td><%=b.getShipping_fee() %></td>
                                       <td><%=b.getTotal() %></td>
                                        <td><%=b.getDate() %></td>
                    </tr>   
               <%     }
                    %>
                    
              
 <tr class="table-info">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td> </td>
                        <td> </td>
                            <td> <a href="home.jsp">
                                  <button type="button" class="btn btn-warning">Back To Home</button>
                            </a></td>  
                    </tr>  
                </tbody>
            </table>
        </div>

    </body>
</html>


