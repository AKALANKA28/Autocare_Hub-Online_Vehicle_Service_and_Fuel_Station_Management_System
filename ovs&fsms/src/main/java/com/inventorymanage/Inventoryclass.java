package com.inventorymanage;

public class Inventoryclass {
    
    private String name;
    private String quantity;
    private String availability;
    private String price;
   

    public Inventoryclass(String name, String quantity, String availability, String price){
        
        this.name = name;
        this.quantity = quantity;
        this.availability =  availability;
        this.price = price;
       
    }


    public String getname(){
        return name;
    }

    public String getquantity(){
        return quantity;
    }

    public String getavailability(){
        return availability;
    }

    public String getprice(){
        return price;
    }
    
}
