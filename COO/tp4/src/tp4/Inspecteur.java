package tp4;
import java.util.Scanner; 

public class Inspecteur extends Personne {
	private Inspecteur clui =null;
	
	private Inspecteur(String n) {
		super(n);
	}
	
	public Inspecteur getInspecteur() {
		String n;
		Scanner sc = new Scanner(System.in);
		if(clui==null) {
			String name = sc.nextLine(); 
			clui = new Inspecteur(name);
		}
		return clui;
	}
	

	
}



