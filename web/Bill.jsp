<%-- 
    Document   : Bill
    Created on : Nov 9, 2020, 8:23:40 AM
    Author     : Admin
--%>

<%@page import="entity.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="entity.Bill"%>
<%@page import="dal.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            h5{
                color: #0076ad;
                font-family: sans-serif;
                font-weight: 200;
                margin-bottom: 20px;
            }
            body{
                background-color: #76b1eb;
            }
            .container{
                background-color: whitesmoke;
                
            }
        </style>
        <!------ Include the above in your HEAD tag ---------->
        <title>Document</title>
    </head>
    <body>

        <div class="container">
            <% DAO d= new DAO();
    String userid=(String) session.getAttribute("userid");
    List<User> u1= d.loadUserInfo(userid);
    User u= u1.get(0);
    %>
    <h1 style="font-family: sans-serif;font-weight: 400;color: #0076ad;text-align: center; margin: 50px auto;">Payment Bill</h1>
    <h5>User : <%=u.getId() %></h5>
       <h5>Phone Number: <%=u.getPhone() %></h5>
          <h5>Email contact  : <%=u.getEmail() %></h5>
          <h5>Address : <%=u.getLocation() %></h5>
          
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                           
                                <%   double sum=0;
                              
                               List<Bill> listBill= new ArrayList<Bill>();
                            
                               
                                if (request.getParameter("option").equals("cart")) {
                                    List<Bill> list = (ArrayList<Bill>) session.getAttribute("listCart");

                                    for (int i = 0; i < list.size(); i++) {
                                        Bill b = list.get(i);
 
                                        if (b.getUser_id().equals(userid)) {
                                            listBill.add(b);
                                        }
                                    }
                                 
                                }
                                if (request.getParameter("option").equals("null")) {
                                   String id= request.getParameter("id");
                                   Date date= Calendar.getInstance().getTime();
                SimpleDateFormat sp= new SimpleDateFormat("dd/MMM/yyyy");
                                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                           Product p= d.searchProductById(id).get(0);
                                    listBill.add(new Bill(p.getId(), userid,p.getName(),
                                            quantity, 30,p.getPrice(),p.getPrice()*quantity+30,sp.format(date)));  
                                }
                                  request.getSession().setAttribute("listBill", listBill);
                                for(int i=0;i<listBill.size();i++){
                                    Bill b= listBill.get(i); 
              Product p=  d.searchProductById(b.getPro_id()).get(0);
                            %>
                                  <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="ProductDetail.jsp?id=<%=b.getPro_id()%>&cate_id=null"> <img class="media-object" src="<%=d.getImageProduct(b.getPro_id(), 1).get(0).getSource()%>" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><%=p.getName()%><a href="#"></a></h4>
                                            <h5 class="media-heading"> Shopping on   <a href="home.jsp">Happy Store</a></h5>

                                        </div>
                                    </div></td>
                                <td class="col-sm-1 col-md-1" style="text-align: center">
                                    <input type="email" class="form-control" id="exampleInputEmail1" readonly="" value="<%=b.getQuantity()%>">
                                </td>
                                <td class="col-sm-1 col-md-1 text-center"><strong>$<%=p.getPrice()%></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong>$<%=p.getPrice() * b.getQuantity()%></strong></td>
                                
                                <td class="col-sm-1 col-md-1">
                                    <a href="removeProBill?id=<%=b.getPro_id()%>">
                                        <button type="button" class="btn btn-warning">
                                            <span class="glyphicon glyphicon-remove"></span> Remove
                                        </button>
                                    </a>
                                </td>
                            </tr>     
                               <% sum += p.getPrice() * b.getQuantity(); 
                                   }

                   
                            %>


                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Subtotal</h5></td>
                                <td class="text-right"><h5><strong>$<%=sum%></strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Estimated shipping</h5></td>
                                <td class="text-right"><h5><strong>$30</strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h3>Total</h3></td>
                                <td class="text-right"><h3><strong>$<%=sum + 30%></strong></h3></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>
                                    <a href="home.jsp">
                                        <button type="button" class="btn btn-warning">
                                            Home
                                        </button></td>  
                                </a>

                                <td>
                                    <a href="payment">
                                        <button type="button" class="btn btn-warning">
                                            Buy now<span class="glyphicon glyphicon-play"></span>
                                        </button>
                                    </a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
