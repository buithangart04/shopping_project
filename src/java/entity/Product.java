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
public class Product {
    String id ,name,description;
    int cate_id,quantity_remain,quantity_sell,sale;
    double primaryPrice ,price ;

    public Product() {
    }
 public Product(String id, String name, String description,
            int cate_id, int quantity_remain, int quantity_sell, int sale, 
            double primaryPrice, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.cate_id = cate_id;
        this.quantity_remain = quantity_remain;
        this.quantity_sell = quantity_sell;
        this.sale = sale;
        this.primaryPrice = primaryPrice;
        this.price = price;
    }
   

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getQuantity_remain() {
        return quantity_remain;
    }

    public void setQuantity_remain(int quantity_remain) {
        this.quantity_remain = quantity_remain;
    }

    public int getQuantity_sell() {
        return quantity_sell;
    }

    public void setQuantity_sell(int quantity_sell) {
        this.quantity_sell = quantity_sell;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public double getPrimaryPrice() {
        return primaryPrice;
    }

    public void setPrimaryPrice(double primaryPrice) {
        this.primaryPrice = primaryPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
