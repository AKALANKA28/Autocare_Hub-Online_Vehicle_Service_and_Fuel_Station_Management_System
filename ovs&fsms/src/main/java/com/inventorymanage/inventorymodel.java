package com.inventorymanage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class inventorymodel {
	private static final Logger logger = Logger.getLogger(inventoryservlet.class.getName());
	
	public void update(String id,String name,String quantity, String availability,String price) {
		try {
			Connection con = DatabaseUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update parts_inventory set part_name=?, quantity_in_stock=?, parts_availability=?, unit_price=? where part_id=? ");
			ps.setString(1,name);
			ps.setString(2,quantity);
			ps.setString(3,availability);
			ps.setString(4,price);
			ps.setString(5,id);
			ps.executeUpdate();
			
			 

	        ps.close(); 
	        con.close(); 
	        
	        logger.info("Added an item to the inventory.");
	            
		}
		catch(Exception e)		
		{
			System.out.println(e);
			logger.log(Level.SEVERE, "Error adding an item to the inventory.", e);
	            
		} 
	}
	
	public void add(String id,String name,String quantity, String availability,String price) {
		try {
			Connection con = DatabaseUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into parts_inventory (part_name, quantity_in_stock, parts_availability,unit_price) VALUES (?, ?, ?,?); ");
			ps.setString(1,name);
			ps.setString(2,quantity);
			ps.setString(3,availability);
			ps.setString(4,price);
			ps.executeUpdate();
			
	        ps.close(); 
	        con.close(); 
	       logger.info("Added a new item to the inventory.");    
		}
		catch(Exception e)		
		{
			System.out.println(e);
			logger.log(Level.SEVERE, "Error adding a new item to the inventory.", e);
            
		}
	}

	public void delete(String id,String name,String quantity, String availability,String price) {
		try {
			Connection con = DatabaseUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM parts_inventory WHERE part_id=?;");
			ps.setString(1,id);
			ps.executeUpdate();
		
	        ps.close(); 
	        con.close(); 
	        
	       logger.info("Removed an item from the inventory.");
	            
		}
		catch(Exception e)		
		{
			System.out.println(e);
			logger.log(Level.SEVERE, "Error removing an item from the inventory.", e);
            
		}
	}

}
