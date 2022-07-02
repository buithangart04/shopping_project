<%-- 
    Document   : ChangeAccount
    Created on : Nov 10, 2020, 11:59:31 PM
    Author     : Admin
--%>



<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="dal.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <title>Document</title>
    </head>
    <body>
        
        <div class="container">
            <h1 style="font-family: sans-serif;font-weight: 400;color: #0076ad;text-align: center; margin: 50px auto;">Add Product</h1>
            <h2> New Product </h2>
            <form action="add" method="post">
  <div class="form-row">
   
    <div class="form-group col-md-6">
        
      <label for="proid">Product ID </label>
      <input type="text" name="id" class="form-control" id="proid"  placeholder="Product Id">
    </div>
      <% DAO d= new DAO();
      List<Category> list= d.loadAllCategory();
      %>
      <div class="form-group col-md-6" >
          <label for="select">Select Category</label>
          <select required style="width: 100%;height: 55%; border-radius: 7px;" name="select" >
             <% for(int i=0;i<list.size();i++) { %>
             <option value="<%=list.get(i).getId()%>"><%=list.get(i).getName() %></option>
            <% }%> 
          </select>
    </div>
  </div>
  <div class="form-group">
    <label for="name">Product Name</label>
    <input type="text" value="" name="name" class="form-control" id="name" placeholder="Product Name">
  </div>
       
                 <div class="form-row">
     <div class="form-group col-md-4">
        
      <label for="quantity-remain">Remain Quantity</label>
      <input type="text" name="quantity_remain" class="form-control" id="quantity-remain" value="" placeholder="Quantity remain">
    </div>
               
                 <div class="form-group col-md-4">
        
      <label for="oldprice">Old Price</label>
      <input type="text" name="oldprice" class="form-control" id="oldprice" value="" placeholder="Old price">
    </div>
                 <div class="form-group col-md-4">
        
      <label for="sale">Sale </label>
      <input type="text" name="sale" class="form-control" id="sale" value="" placeholder="Sale ">
    </div>
  </div>
                <div class="form-row" style="text-align: center;">
           <div class="form-group col-md-4"> 
              <label for="image1">Choose image 1</label>
               <input type="file" name="image1" class="form-control" id="image1"  >
           </div>
           <div class="form-group col-md-4"> 
              <label for="image2">Choose image 2</label>
               <input type="file" name="image2" class="form-control" id="image2"  >
           </div>
       </div>
                <div class="form-group" >
    <label for="description">Description</label>
  <input type="text" name="description" class="form-control" id="description" placeholder="description ">
        
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
       Are you sure?
      </label>
    </div>
  </div>
                <button type="submit" class="btn btn-primary" style="margin-right: 70px; ">Add </button>
   <button type="submit" class="btn btn-primary"> Back To Home </button>
</form>
            </div>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script type="text/javascript">
var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
 
 alert("Product Id was exited");

 }
 </script> 
    </body>
</html>

