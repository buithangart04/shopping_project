<%-- 
    Document   : ChangeAccount
    Created on : Nov 10, 2020, 11:59:31 PM
    Author     : Admin
--%>



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
         <% DAO d= new DAO();
    String id=(String) session.getAttribute("userid");
    List<User> u1= d.loadUserInfo(id);
    User u= u1.get(0);
    %>
        <div class="container">
            <h1 style="font-family: sans-serif;font-weight: 400;color: #0076ad;text-align: center; margin: 50px auto;">Change account</h1>
            <h2> User :<%=id %></h2>
            <form action="changeaccount" method="post">
  <div class="form-row">
   
    <div class="form-group col-md-6">
        
      <label for="inputPassword4">Password</label>
      <input type="text" name="pass" class="form-control" id="inputPassword4" value="<%=u.getPass() %>" placeholder="Password">
    </div>
      <div class="form-group col-md-6">
      <label for="phonenumber">Phone Number</label>
      <input type="number"  value="<%=u.getPhone() %>" name="phone" class="form-control" id="phonenumber" placeholder="Phone Number">
    </div>
  </div>
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" value="<%=u.getEmail() %>" name="email" class="form-control" id="email" placeholder="Thangdz2000@gmail.com">
  </div>
            <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" value="<%=u.getLocation() %>"name="location" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>
  <div class="form-group">
    <label for="Date of birth">Date of birth</label>
    <input type="text" value="<%=u.getDob() %>"name="dob" class="form-control" id="Date of birth">
  </div>

  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
       Are you sure?
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Change my account</button>
</form>
            </div>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>

