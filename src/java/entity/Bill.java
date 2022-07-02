/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Bill {
   String pro_id,user_id,name;
   int quantity;
   double shipping_fee,price,total;
   String date;
    public Bill() {
    }

    public Bill(String pro_id, String user_id, String name, int quantity, double shipping_fee, double price, double total, String date) {
        this.pro_id = pro_id;
        this.user_id = user_id;
        this.name = name;
        this.quantity = quantity;
        this.shipping_fee = shipping_fee;
        this.price = price;
        this.total = total;
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

   
    public String getPro_id() {
        return pro_id;
    }

    public void setPro_id(String pro_id) {
        this.pro_id = pro_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getShipping_fee() {
        return shipping_fee;
    }

    public void setShipping_fee(double shipping_fee) {
        this.shipping_fee = shipping_fee;
    }

    @Override
    public String toString() {
        return "Bill{" + "pro_id=" + pro_id + ", user_id=" + user_id + ", name=" + name + ", quantity=" + quantity + ", shipping_fee=" + shipping_fee + ", price=" + price + ", total=" + total + ", date=" + date + '}';
    }
   
}
