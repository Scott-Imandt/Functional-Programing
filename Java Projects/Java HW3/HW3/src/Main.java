import java.util.ArrayList;
import java.util.HashMap;




public class Main {

	public static void main(String[] args) {
		
	ArrayList<Integer> l1 = new ArrayList<Integer>();
	
	l1.add(12);	l1.add(11); l1.add(1); l1.add(13); l1.add(111); l1.add(21); l1.add(13); l1.add(14); l1.add(1111); 
	
	System.out.println(SimpleUtils.least(l1, false));
	
	// -------------- //
	
	HashMap<String, Integer> map = new HashMap<>();
	
	map.put("Scott", 1234);
	map.put("Mike", 2345);
	map.put("Alex", 3333);
	
	
	
	System.out.println(SimpleUtils.flatten(map));
	
	
	// -----------------------//
	}	

}
