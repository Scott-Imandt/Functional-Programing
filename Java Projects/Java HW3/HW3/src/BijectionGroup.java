import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class BijectionGroup {


	//The job of this bijectionsOf(Set<T>) method is to take a set as its input argument, and 
	
	//return the set of all the bijections of the input set.
	
	//Specifically, the following code must compile and run with your
	//implementation:
	
	public static <T> Set<Function<T, T>> bijectionsOf(Set<T> domain) {
	    ArrayList<T> AL = new ArrayList<>(domain);
	    return perm(AL, new ArrayList<>(), domain.size(), 0)
	        .stream()
	        .map(list -> (Function<T, T>) t -> list.get(AL.indexOf(t)))
	        .collect(Collectors.toSet());
	}
	
	public static <T> ArrayList<ArrayList<T>> perm(ArrayList<T> AL, ArrayList<ArrayList<T>> perms, int n, int init){

		//base
        if (init==n){
            perms.add(new ArrayList<>(AL));
        }

        for (int i=init; i<n; i++){
           
        	Collections.swap(AL,init,i);

        	//recall
        	perm(AL,perms,n,init+1);
            
        	Collections.swap(AL,init,i);
        }
        return perms;
    }
	
	public static <T> Group<Function<T,T>> bijectionGroup(Set<Integer> few) {
				
		Group<Function<T,T>> anom = new Group<Function<T,T>>(){

			@Override
			public Function<T, T> binaryOperation(Function<T, T> one,
				Function<T, T> other) {
				
				Function<T, T> f = (T) -> {
				 
				return other.apply(one.apply(T));
				};
				
				return f;
			}

			@Override
			public Function<T, T> identity() {
				
				 Function<T, T> f = (T) -> T;
				 
				return f;
			}

			@Override
			public Function<T, T> inverseOf(Function<T, T> t) {
				
				 Function<T, T> f = (T) -> {
				
					return t.apply(t.apply(T));
					 
				 };
				 
				 return f;
			}

		};
		
		return anom;	
	}
	
	public static void main(String... args) {
		Set<Integer> a_few = Stream.of(1, 2, 3).collect(Collectors.toSet());
		
		// you have to figure out the data type in the line below
		Set<Function<Integer,Integer>> bijections = bijectionsOf(a_few);
		
		bijections.forEach(aBijection -> {
		a_few.forEach(n -> System.out.printf("%d --> %d; ", n, aBijection.apply(n)));
		System.out.println();
		});
		
		
		// you have to figure out the data types in the lines below
		Group<Function<Integer,Integer>> g = bijectionGroup(a_few);
		Function<Integer, Integer> f1 = bijectionsOf(a_few).stream().findFirst().get();
		Function<Integer, Integer> f2 = g.inverseOf(f1);
		Function<Integer, Integer> id = g.identity();
		Function<Integer, Integer> bo = g.binaryOperation(f1, f2);
		
		System.out.println();
		for(int i =1; i<4; i++) {
			
			System.out.println(i +" --> " + f1.apply(i));
		}
		
		System.out.println();
		for(int i =1; i<4; i++) {
			
			System.out.println(i +" --> " + f2.apply(i));
		}
		
		System.out.println();
		for(int i =1; i<4; i++) {
			
			System.out.println(i +" --> " + id.apply(i));
		}
		
		System.out.println();
		for(int i =1; i<4; i++) {
			
			System.out.println(i +" --> " + bo.apply(i));
		}
		
	
	
	
	}
		


	
}
