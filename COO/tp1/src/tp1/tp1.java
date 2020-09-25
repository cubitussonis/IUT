
package tp1;

import java.sql.*;
import java.util.*;
import java.text.*;

public class tp1 {
   
    static final String url="jdbc:postgresql://148.60.237.2/pg_mlongeanie?user=mlongeanie&password=#Ftllo23!";
   
    static Connection connex;

    public static void main(String[]args) {
       
       
        try{
                connex = DriverManager.getConnection(url);
                Statement stm = connex.createStatement();
               
               
                /*___________________________________________________________*/
                /* la moyenne des salaires des employés */
                /*___________________________________________________________*/

               
                /*
                float moy;
                ResultSet res;
                res = stm.executeQuery("select avg(sal) from tp1_jdbc.emp");
               
               
                while (res.next()) {
                    moy=res.getFloat(1);
                    System.out.println("Moyenne salaire="+moy);
      }
                */
               
                

                /*___________________________________________________________*/
                /* le numéro, le nom, le salaire de chaque employé */
                /*___________________________________________________________*/

               
               
                /*
                int matr;
                String nome;
                float sal;
               
                ResultSet res;
                res = stm.executeQuery("select matr,nome,sal from tp1_jdbc.emp");
               
               
                while (res.next()) {
                    matr=res.getInt(1);
                    nome=res.getString(2);
                    sal=res.getFloat(3);
                    System.out.println("Numéro : "+matr+" Nom : "+nome+" Salaire : "+sal);
                }
                */
               
                /*___________________________________________________________*/
                /* le nom des employés occupant un poste de secrétaire*/
                /*___________________________________________________________*/

                /*
                String nome;
               
         public class tp1 {

}       ResultSet res;
                res = stm.executeQuery("select nome from tp1_jdbc.emp where poste='SECRETAIRE'");
               
               
                while (res.next()) {
                    nome=res.getString(1);
                    System.out.println("Nom : "+nome);
                }
                */
          
               
               
                /*___________________________________________________________*/
                /* le nom des départements ayant au moins un secrétaire*/
                /*___________________________________________________________*/
               
               
                /*
                String nomd;
               
                ResultSet res;
                res = stm.executeQuery("select nomd from tp1_jdbc.deptm inner join tp1_jdbc.emp on tp1_jdbc.deptm.dept = tp1_jdbc.emp.dept  where tp1_jdbc.emp.poste='SECRETAIRE';");
               
               
                while (res.next()) {
                    nomd=res.gtp1etString(1);
                    System.out.println("Nom département: "+nomd);
                }
                */
               

                /*___________________________________________________________*/
                /* le nom et la moyenne des salaires par département */
                /*___________________________________________________________*/
               
                /*String nomd;
                float moy;
               
                ResultSet res;
                res = stm.executeQuery("SELECT deptm.nomd, avg(sal) FROM tp1_jdbc.deptm deptm INNER JOIN tp1_jdbc.emp emp ON deptm.dept = emp.dept  GROUP BY emp.dept, deptm.nomd ;");
               
               
                while (res.next()) {
                    nomd=res.getString(1);
                    moy =res.getFloat(2);
                    System.out.println(nomd+" = "+moy);
                    
                }*/
                
                /*___________________________________________________________*/
                /* le nom et la date d’embauche de chaque salarié */
                /*___________________________________________________________*/
                
                /*String nomd;
                java.sql.Date datemb;
        		ResultSet res;
                res = stm.executeQuery("SELECT nome, datemb FROM tp1_jdbc.emp");
               
               
                while (res.next()) {
                    nomd=res.getString(1);
                    datemb =res.getDate(2);
                    DateFormat datembLettre = new SimpleDateFormat("dd MMMM yyyy");
                    System.out.println(nomd+" -> "+datembLettre.format(datemb));
                    
                }*/
                
                /*___________________________________________________________*/
                /* le nom et le salaire de l’employé ayant le plus grand salaire */
                /*___________________________________________________________*/
                
                /*String nomd;
                Float sal;
        		ResultSet res;
                res = stm.executeQuery("SELECT nome, sal FROM tp1_jdbc.emp ORDER BY sal DESC LIMIT 1");
               
               
                while (res.next()) {
                    nomd=res.getString(1);
                    sal =res.getFloat(2);
                    
                    System.out.println(nomd+" -> "+sal);
                    
                }*/
                
                /*___________________________________________________________*/
                /* le  nom  de  chaque  département,  avec  son  nombre  d’employés,  le  salaire  minimum, maximum et moyen dans ce département, */
                /*___________________________________________________________*/
                
                /*String nomd;
                Float salmin,salmax,salavg;
                int nbEmp;
        		ResultSet res;
                res = stm.executeQuery("SELECT deptm.nomd, min(sal),max(sal),avg(sal),count(nomd) nbEmP FROM tp1_jdbc.deptm deptm INNER JOIN tp1_jdbc.emp emp ON deptm.dept = emp.dept  GROUP BY emp.dept, deptm.nomd ");
               
               
                while (res.next()) {
                    nomd=res.getString(1);
                    salmin =res.getFloat(2);
                    salmax =res.getFloat(3);
                    salavg =res.getFloat(4);
                    nbEmp =res.getInt(5);
                    
                    System.out.println(nomd+" \t min: "+salmin+ "\t max: "+salmax+" \t avg: "+salavg+"\t nb emp: "+nbEmp);
                    
                }*/
                //e  nom  de  chaque  département,  avec  son  nombre  d’employés,  le  salaire  minimum, maximum et moyen dans ce département,     
                
                /*___________________________________________________________*/
                /* les départements n’ayant pas de secrétaire*/
                /*___________________________________________________________*/
                
                /*int dept;
        		ResultSet res;
                res = stm.executeQuery("(SELECT distinct emp.dept  FROM tp1_jdbc.emp) EXCEPT (SELECT distinct emp.dept  FROM tp1_jdbc.emp WHERE emp.poste = 'SECRETAIRE')");
               
                while (res.next()) {
                    dept =res.getInt(1);
                    
                    System.out.println("departement : "+ dept);
                    
                }*/
                
                
                /*___________________________________________________________*/
                /* le nom du département ayant le plus d’employés.*/
                /*___________________________________________________________*/
                
                /*int nb;
                String nomd;
        		ResultSet res;
                res = stm.executeQuery("SELECT deptm.nomd, count(nomd) nbEmP FROM tp1_jdbc.deptm deptm INNER JOIN tp1_jdbc.emp emp ON deptm.dept = emp.dept  GROUP BY emp.dept, deptm.nomd ORDER BY nbEmp DESC LIMIT 1");
               
                while (res.next()) {
                    nb =res.getInt(2);
                    nomd =res.getString(1);
                    
                    System.out.println(nomd+" --> "+ nb);
                    
                }*/
                
                
                /*___________________________________________________________*/
                /* pour chaque département, le nom du département, le nom de l’employé (et son salaire) ayant le plus grand salaire du département.*/
                /*___________________________________________________________*/
                
                float sal;
                String nome;
        		ResultSet res;
                res = stm.executeQuery("SELECT emp.nome, temp.maxsal from tp1_jdbc.emp emp INNER JOIN (SELECT deptm.nomd, max(sal) maxsal FROM tp1_jdbc.deptm deptm INNER JOIN tp1_jdbc.emp emp ON deptm.dept = emp.dept  GROUP BY emp.dept, deptm.nomd) temp ON emp.sal = temp.maxsal");
               
                while (res.next()) {
                    sal =res.getFloat(2);
                    nome =res.getString(1);
                    
                    System.out.println(nome+" --> "+ sal);
                    
                }
               
               
               
                connex.close();
            }
       
       
        catch (Exception e) { System.out.println(" pb : " + e ); }
  
    }
}
