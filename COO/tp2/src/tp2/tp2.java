package tp2;

import java.sql.*;

public class tp2 {
	static final String url="jdbc:postgresql://148.60.237.2/pg_mlongeanie?user=mlongeanie&password=#Ftllo23!";
	   
    static Connection connex;
    
    public static void infoDept(int deptnumber) {
		
    	
    	try{
            connex = DriverManager.getConnection(url);
            PreparedStatement stm = connex.prepareStatement("SELECT dept, nome,sal,comm FROM tp2_jdbc.EMP emp WHERE dept = ?");
            stm.setInt(1,deptnumber);
            
            ResultSet res = stm.executeQuery();
    		
           while(res.next()) {
        	   if(res.getString(4)==null) {
        		   System.out.printf("Departement : %d, nom: %s, salaire: %d, commission: Pas de Commission \n", res.getInt(1),res.getString(2),res.getInt(3));
        	   }else {	   
        		   System.out.printf("Departement : %d, nom: %s, salaire: %d, commission: %d \n", res.getInt(1),res.getString(2),res.getInt(3),res.getInt(4));
        	   }
        		   
        		   
           }
           
           
           
           
            connex.close();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
		
		
	}
    
	public static void augmentation(int deptnumber, double aug) {
			
	    	
	    	try{
	            connex = DriverManager.getConnection(url);
	            PreparedStatement stm = connex.prepareStatement("UPDATE tp2_jdbc.EMP SET sal = sal* ? WHERE dept = ?");
	            stm.setDouble(1,aug);
	            stm.setInt(2,deptnumber);
	            
	            stm.execute();
	           
	           
	           
	           
	            connex.close();
	        }
	   
	   
	    	catch (Exception e) { System.out.println(" pb : " + e ); }
			
			
		}
	
	public static void augmentationDepts() {
		int [][] aug = {
						{10,2},
						{20,3},
						{30,4}
					   };
    	
    	try{
            connex = DriverManager.getConnection(url);
            PreparedStatement stm = connex.prepareStatement("UPDATE tp2_jdbc.EMP SET sal = sal* ? WHERE dept = ?");
            
            for(int i=0; i<aug.length;i++) {
            	stm.setInt(1,aug[i][1]);
            	stm.setInt(2,aug[i][0]);
            	stm.execute();
            }
           
           
           
           
            connex.close();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
		
		
	}
	
	public static void deptMaxSalaire() {
		
    	
    	try{
            connex = DriverManager.getConnection(url);
            PreparedStatement stm = connex.prepareStatement("SELECT temp.dept FROM (SELECT sum(emp.sal) sumSal, emp.dept FROM tp2_jdbc.EMP emp GROUP BY emp.dept) as temp ORDER BY temp.sumSal DESC LIMIT 1");
            
            ResultSet res = stm.executeQuery();
           
           
           
           if(res.next()) {
        	   infoDept(res.getInt(1));
           }
           
            connex.close();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
		
		
	}
	

    public static void main(String[]args) {
    	
    	
    	infoDept(10);
    	infoDept(20);
    	infoDept(30);
    	augmentationDepts();
    	infoDept(10);
    	infoDept(20);
    	infoDept(30);
    	
    	//augmentation(10, 1.15);
    	
    	//infoDept(10);
    	//deptMaxSalaire();
    	
    }
}
