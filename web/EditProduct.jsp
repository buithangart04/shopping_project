<%-- 
    Document   : EditProduct
    Created on : Nov 10, 2020, 11:36:47 AM
    Author     : Admin
--%>

<%@page import="dal.DAO"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Product Detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="ProductDetail.css">
        <style>
            .input{
                width: 70%;
                height: 40px;
            }
        </style>
    </head>

    <body style="background-color: #76b1eb ">
        <jsp:useBean  id="db" class="dal.DAO"/>
        <c:set var="id" value="${param.id}"/>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1">
                                    <img src="${db.getImageProduct(id, 1).get(0).getSource()}">
                                </div>

                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">

                            </ul>

                        </div>
                        <div class="details col-md-6">
                            <form action="changeproduct?id=${id}">
                                <% DAO d = new DAO();
                                    Product p = d.searchProductById(request.getParameter("id")).get(0);
                                %>
                                <label for="name">
                                    Product name 
                                </label><br>
                                <input  class="input" id="name" type="text" name="name" value="<%=p.getName()%>"/><br>



                                <label for="primaryPrice">
                                    Old Price 
                                </label><br>
                                <input  class="input"  id="primaryPrice" type="text" name="primaryPrice" value="<%=p.getPrimaryPrice()%>"/><br>



                                <label for="sale">
                                    Sale
                                </label><br>
                                <input  class="input"  id="sale" type="text" name="sale" value="<%=p.getSale()%>"/><br>


                                <label for="quantity_remain">
                                    Quantity remain
                                </label><br>
                                <input  class="input"  id="name" type="number" name="quantity_remain" value="<%=p.getQuantity_remain()%>"/><br>


                                <label for="description">
                                    Product description
                                </label><br>
                                <input  class="input"  id="description" type="text" name="description" value="<%=p.getDescription()%>"/><br>

                                <label for="image1">Add more image</label>
                                <input class="input" type="file" name="image1" class="form-control" id="image1"  >
                                <div class="action">
                                    <button   class="add-to-cart btn btn-default" type="submit">Change Information</button>
                                   
                                </div>
                                <input type="hidden" name="id" value="${id}"/>
                            </form>
                                 <div class="action">
                                     <button style="margin-top: 20px;" onclick="window.location.href='delete?id=${id}' "class="add-to-cart btn btn-default" >Delete Product</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>

           
        </script>

    </body>
</html>

