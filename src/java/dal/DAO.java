/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.Admin;
import entity.Bill;
import entity.Category;
import entity.Product;
import entity.ProductImage;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */

public class DAO extends DBContext{
    public boolean checkAdminLogin(Admin a){
        String sql="select * from admin where id=? and pass=?";
        PreparedStatement st;
        try {
            st = con.prepareStatement(sql);
             st.setString(1,a.getId());
             st.setString(2,a.getPass());
             ResultSet rs = st.executeQuery();
             if(rs.next()) return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false ;
    }
    public void updateProduct(String id,String name ,String primaryPrice,String sale,String quantity_remain,String description ){
        String sql="update products set name=?,quantity_remain=?,primaryPrice=?,sale=?,description=? where id=?";
        try {
              PreparedStatement st= con.prepareStatement(sql);
              st.setString(1, name);
               st.setString(2, quantity_remain);
               st.setString(3, primaryPrice);
               st.setString(4, sale);
               st.setString(5, description);
               st.setString(6, id);
               st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public List<Product>loadTopItem(){
        List<Product> list= new ArrayList<>();
        String sql= "select top 4 *\n" +
"from products\n" +
"order by quantity_sell desc";
        /*String id, String name, String description,
            int cate_id, int quantity_remain, int quantity_sell, int sale, 
            double primaryPrice, double price */
        try {
             PreparedStatement st= con.prepareStatement(sql);
             ResultSet rs= st.executeQuery();
             while (rs.next()) {
           list.add(new Product(rs.getString("id"), rs.getString("name"),rs.getString("description"), 
                        rs.getInt("cate_id"), rs.getInt("quantity_remain"),  rs.getInt("quantity_sell"),  rs.getInt("sale"),
                        rs.getFloat("primaryPrice"),  rs.getFloat("price")));     
                
            }
        } catch (Exception e) {
        }
        return  list;
    }
    public List <Product> searchTextProduct(String txt){
        String sql = "select p.*\n" +
"from products p join category c\n" +
"on p.cate_id=c.id\n" +
"where p.name like '%'+?+'%' or c.name like '%'+?+'%'";
        List <Product> list= new ArrayList<>();
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, txt);
            st.setString(2, txt);
         ResultSet rs= st.executeQuery();
         while(rs.next()){
            list.add(new Product(rs.getString("id"), rs.getString("name"),rs.getString("description"), 
                        rs.getInt("cate_id"), rs.getInt("quantity_remain"),  rs.getInt("quantity_sell"),  rs.getInt("sale"),
                        rs.getFloat("primaryPrice"),  rs.getFloat("price")));  
         }
        } catch (Exception e) {
        }
        return  list;
    }
    public void changeAccountUser(User u){
        String sql="update users set email=? ,phone=? ,pass=?,dob=?,location=N'"+ u.getLocation()+"' where id=?";
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, u.getEmail());
             st.setString(2, u.getPhone()+"");
              st.setString(3, u.getPass());
               st.setString(4, u.getDob());
               // st.setString(5, u.getLocation());
                 st.setString(5, u.getId());
                 st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public List<User>loadUserInfo(String id ){
     String sql ="select * from users where id= ?";   
     List<User> u= new ArrayList<>();
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                u.add(new User(rs.getString(1), rs.getString(4), rs.getString(2), rs.getString(6), rs.getString(5), rs.getInt(3))) ;
            }
        } catch (Exception e) {
        }
        return  u;
    }
    
    public List<Product> searchProduct(Object id,Object cate_id){
           List<Product> list= new ArrayList<>(); 
         String sql="select * from products where 1=1";
         if((String)id != null&&((String)id).equals("null")==false){
             sql+=" and id= "+(String)id;
         }
         if(cate_id!=null&&((String)cate_id).equals("null")==false){
              sql+=" and cate_id= "+(String)cate_id;
         }
         try {
           PreparedStatement st= con.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                /*String id, String name, String description,
            int cate_id, int quantity_remain, int quantity_sell, int sale, 
            double primaryPrice, double price*/
                list.add(new Product(rs.getString("id"), rs.getString("name"),rs.getString("description"), 
                        rs.getInt("cate_id"), rs.getInt("quantity_remain"),  rs.getInt("quantity_sell"),  rs.getInt("sale"),
                        rs.getFloat("primaryPrice"),  rs.getFloat("price")));
            }   
        } catch (Exception e) {
        }
                   return list;

    }
     public List<Product> searchProductById(Object id){
           List<Product> list= new ArrayList<>(); 
         String sql="select * from products where id=?";
       
         try {
           PreparedStatement st= con.prepareStatement(sql);
           st.setString(1,(String) id);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                /*String id, String name, String description,
            int cate_id, int quantity_remain, int quantity_sell, int sale, 
            double primaryPrice, double price*/
                list.add(new Product(rs.getString("id"), rs.getString("name"),rs.getString("description"), 
                        rs.getInt("cate_id"), rs.getInt("quantity_remain"),  rs.getInt("quantity_sell"),  rs.getInt("sale"),
                        rs.getFloat("primaryPrice"),  rs.getFloat("price")));
            }   
        } catch (Exception e) {
        }
                   return list;

    }
     public void addImageProduct(ProductImage pi){
         String sql="insert into sourcesProduct values (?,?,?)";
         try {
             PreparedStatement st= con.prepareStatement(sql); 
             st.setString(1, pi.getPro_id());
               st.setString(2, pi.getSource());
                 st.setString(3, pi.getImage()+"");
              st.executeUpdate();
         } catch (Exception e) {
         }
     }
     public void addProduct(Product p){
         String sql= "insert into products values(?,?,?,?,?,?,?,?,?)";
         try {
             PreparedStatement st= con.prepareStatement(sql);
             st.setString(1, p.getId());
             st.setString(2, p.getCate_id()+"");
             st.setString(3, p.getName());
             st.setString(4, p.getQuantity_remain()+"");
             st.setString(5, p.getQuantity_sell()+"");
             st.setString(6, p.getPrimaryPrice()+"");
             st.setString(7, p.getSale()+"");
             st.setString(8, p.getPrice()+"");
             st.setString(9, p.getDescription());
             st.executeUpdate();
         } catch (Exception e) {
         }
     }
    public List<Product> getProductByPage(List<Product>list,int start,int end){
     List<Product> arr= new ArrayList<Product>();
     for(int i=start;i<end;i++){
       arr.add(list.get(i));  
     }
     return arr;
    }
    public List<ProductImage> getImageProduct(Object pro_id,int image){
        List<ProductImage> list= new ArrayList<>();
        String sql="select * from sourcesProduct where pro_id =? ";
        if(image>0){
          sql+=" and mainImage ="+image;  
        }
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1,(String) pro_id);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                list.add(new ProductImage(rs.getString(1), rs.getInt(3), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void updateQuantityAfterPayment(String pro_id,int quantity){
       String sql="update products set quantity_sell=? where id=?";
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, quantity+"");
              st.setString(2, pro_id);
              st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public boolean checkProductExited(String id){
       String sql= "select * from products where id=?";
        try {
       PreparedStatement st= con.prepareStatement(sql);
       st.setString(1, id);
       ResultSet rs= st.executeQuery();
       if(rs.next()) return true;
        } catch (Exception e) {
        }
        return false;
    }
    public List<Bill> loadBill(String userid){
       List<Bill> list= new ArrayList<>();
       String sql="select * from bill where 1=1";
       if(userid.equals("null")==false){
           sql+=" and user_id='"+userid+"'";
       }
        try {
          PreparedStatement st=con.prepareStatement(sql);
          ResultSet rs= st.executeQuery();
            while (rs.next()) {
           list.add(new Bill(rs.getString(1),rs.getString(2 ),rs.getString(8),
                   rs.getInt(3), rs.getDouble(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7)));
                
            }
        } catch (Exception e) {
        }
      
       
       return list;
    }
     public void deleteProduct(String id){
        String sql="delete products where id=?";
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    public void deleteImageProduct(String id){
        String sql="delete sourcesProduct where pro_id=?";
        try {
            PreparedStatement st= con.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    public static void main(String[] args) {
        DAO d= new DAO();
     for(Product p: d.searchTextProduct("p")){
         System.out.println(p.toString());
     }}
    
    public List<Category> loadAllCategory(){
        List<Category> list= new ArrayList<>();
        String sql="select * from category";
        try {
            PreparedStatement st= con.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
      public boolean checkUserLogin(String id ,String pass){
        String sql="select * from users where id=? and pass=?";
        PreparedStatement st;
        try {
            st = con.prepareStatement(sql);
             st.setString(1,id);
             st.setString(2,pass);
             ResultSet rs = st.executeQuery();
             if(rs.next()) return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false ;
    }
      public void insertBill(Bill b){
          String sql="insert into bill values (?,?,?,?,?,?,?,?) ";
          try {
              PreparedStatement st= con.prepareStatement(sql);
              st.setString(1, b.getPro_id());
               st.setString(2, b.getUser_id());
                 st.setString(8, b.getName());
                st.setString(3, b.getQuantity()+"");
                 st.setString(4, b.getShipping_fee()+"");
                  st.setString(5, b.getPrice()+"");
                   st.setString(6, b.getTotal()+"");
                    st.setString(7, b.getDate()+"");
                 st.executeUpdate();
          } catch (Exception e) {
          }
      }
      public void registerUser(User u){
        String sql="insert into users values (?,?,?,?,?,?)";  
        PreparedStatement st;
        try {
            st = con.prepareStatement(sql);
             st.setString(1,u.getId());
             st.setString(2,u.getEmail());
             st.setString(3,u.getPhone()+"");
             st.setString(4,u.getPass());
             st.setString(5,u.getDob());
             st.setString(6,u.getLocation());
             st.executeUpdate();
        }
        catch(SQLException ex){
             Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);     
             }
      }
}
