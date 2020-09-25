package tp2;

import java.sql.*;

public class meta {
	static final String url="jdbc:postgresql://148.60.237.2/pg_mlongeanie?user=mlongeanie&password=#Ftllo23!";
	   
    static Connection connex;
    
    public static void main(String[]args) {
    	
    	/*try{
    		connex = DriverManager.getConnection(url);
            PreparedStatement stm = connex.prepareStatement("SELECT * FROM tp2_jdbc.emp");
            ResultSet res = stm.executeQuery();
            ResultSetMetaData resMeta = res.getMetaData();
            		
            for(int i = 1; i<= resMeta.getColumnCount();i++) {
            	System.out.println(resMeta.getColumnName(i)+" "+resMeta.getColumnTypeName(i));
            	
            }
            
           
           
            connex.close();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }*/
    	
    	try{
    		connex = DriverManager.getConnection(url);
            PreparedStatement stm = connex.prepareStatement("SELECT matr, substr(nome,1,3),sal*(1+comm/100) gain FROM tp2_jdbc.emp");
            ResultSet res = stm.executeQuery();
            ResultSetMetaData resMeta = res.getMetaData();
            		
            for(int i = 1; i<= resMeta.getColumnCount();i++) {
            	System.out.println(resMeta.getColumnName(i)+" "+resMeta.getColumnTypeName(i));
            	
            }
            
           
           
            connex.close();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
    	
    }

}
