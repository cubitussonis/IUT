package tp2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

//Marius Longeanie A1

public class EDF {
	static final String url="jdbc:postgresql://148.60.237.2/pg_mlongeanie?user=mlongeanie&password=#Ftllo23!";
	   
    static Connection connex;
    
	public static void connection() throws SQLException {
		connex = DriverManager.getConnection(url);
	}
	
	public static void deconnection() throws SQLException {
		connex.close();
	}
	
	public static void afficheClients() {
		
		try{
			connection();
            PreparedStatement stm = connex.prepareStatement("SELECT name, address FROM edf.clients");
            
            ResultSet res = stm.executeQuery();
           
           
           
           while(res.next()) {
        	   System.out.println("nom = "+res.getString(1)+" | adresse = "+res.getString(2));
           }
           
           deconnection();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
	}
	
	public static void affiche5releves() {
			
			try{
				connection();
	            PreparedStatement stm = connex.prepareStatement("SELECT energy, date_of_reading FROM edf.readings ORDER BY energy DESC LIMIT 5;");
	            
	            ResultSet res = stm.executeQuery();
	           
	           
	           
	           while(res.next()) {
	        	   System.out.println("valeur = "+res.getFloat(1)+" | heure = "+res.getTime(2));
	           }
	           
	           deconnection();
	        }
	   
	   
	    	catch (Exception e) { System.out.println(" pb : " + e ); }
		}
	
	public static void updateClient() {
			
			try{
				connection();
	            PreparedStatement stm = connex.prepareStatement("UPDATE edf.clients SET name = ? WHERE id = ?");
	            stm.setString(1,"Patrick Savoie");
	            stm.setInt(2,4632009);
	            stm.execute();
	           	           
	           deconnection();
	        }
	   
	   
	    	catch (Exception e) { System.out.println(" pb : " + e ); }
	}
	
	public static void AfficheDataClient() {
		
		try{
			connection();
            PreparedStatement stm = connex.prepareStatement("SELECT name , sum(energy) FROM edf.clients c INNER JOIN edf.readings r ON c.id = r.client GROUP BY c.id");
            
            ResultSet res = stm.executeQuery();
           
           
           
           while(res.next()) {
        	   System.out.println("nom = "+res.getString(1)+" | consomation en kWh = "+res.getFloat(2)+" | consommation en euro = "+res.getFloat(2)*0.1344);
           }
           
           deconnection();
        }
   
   
    	catch (Exception e) { System.out.println(" pb : " + e ); }
	}
	
		public static void supprimerClients() {
				
				try{
					connection();
		            PreparedStatement stm = connex.prepareStatement("WITH deleter AS\n" + 
		            		"(\n" + 
		            		"  DELETE FROM edf.readings WHERE client = (SELECT DISTINCT c.id FROM edf.clients c INNER JOIN edf.readings r ON c.id = r.client GROUP BY c.id HAVING sum(energy) = 0) RETURNING client\n" + 
		            		")\n" + 
		            		"DELETE FROM edf.clients WHERE id = (SELECT DISTINCT client FROM deleter);");
		            
		             stm.execute();
		           
		           
		           
		          
		           
		           deconnection();
		        }
		   
		   
		    	catch (Exception e) { System.out.println(" pb : " + e ); }
		}
		
		
	
		public static void dataTrancheHeures() {
			
			try{
				connection();
	            PreparedStatement stm = connex.prepareStatement("SELECT date_of_reading,max(energy), min(energy), avg(energy), sum(energy) FROM edf.clients c INNER JOIN edf.readings r ON c.id = r.client GROUP BY r.date_of_reading;");
	            
	            ResultSet res = stm.executeQuery();
	           
	           
	           
	           while(res.next()) {
	        	   System.out.println("tranche = "+res.getTime(1)+" | max = "+res.getFloat(2)+" | min = "+res.getFloat(3)+" | moyenne = "+res.getFloat(4)+" | totale = "+res.getFloat(5));
	           }
	           
	           deconnection();
	        }
	   
	   
	    	catch (Exception e) { System.out.println(" pb : " + e ); }
		}
		
		
		public static void DetailedDataClient() {
			
			try{
				connection();
	            PreparedStatement stm = connex.prepareStatement("SELECT c.name, r.energy, date_of_reading FROM edf.clients c INNER JOIN edf.readings r ON c.id = r.client ORDER BY c.id");
	            ResultSet res = stm.executeQuery();
	            int nb = 1;
	            float somme = 0;
	            while(res.next()) {
	            	
	            	if(res.getTime(3).toString() == "00:00:00" || res.getTime(3).toString() == "04:00:00" || res.getTime(3).toString() == "08:00:00" || res.getTime(3).toString() == "16:00:00" || res.getTime(3).toString() == "20:00:00") {
	            		somme += res.getFloat(2)*0.1344;
	            	}else {
	            		somme += res.getFloat(2)*0.1798;
	            	}
	            	
					if(nb%6 ==0) {
						System.out.println("nom = "+res.getString(1)+" | Consommation = "+somme+" euros"); 
						somme = 0;
	            	}
	            	
					nb++;
	            
	            }
	           
	          
	           
	           deconnection();
	        }
	   
	   
	    	catch (Exception e) { System.out.println(" pb : " + e ); }
		}
	
	/* Question 10:
	 * 
	 * Pour identifier les consommations suspectent on pourrait mettre en place une methode qui detecte si 
	 * la consommation est exactement pareil en fonction des differentes tranches d'horaire.
	 * On pourrait aussi implementer une methode qui detecte s'il y a regulierement une tres haute consommation la nuit. 
	 * 
	 * */
	
	public static void main(String[]args) {
	    	
	    	
		//afficheClients();
		//updateClient();
		//affiche5releves();
		//AfficheDataClient();
		//dataTrancheHeures();
		//supprimerClients();
		//DetailedDataClient();
   }
	
	
}
