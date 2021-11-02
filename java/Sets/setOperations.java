/*
In this problem, we will implement the set operations of inter-
section and union. The class SetUtilities contains the starter code for
this problem. You may not use the retainAll() or addAll() methods of
a set in this problem.
*/


import java.util.Set;
import java.io.FileNotFoundException;
import java.util.HashSet;

// implement union and intersection
public class setOperations {
    public static void main(String[] args) {
        Set<Integer> set1 = new HashSet<Integer>(); 
        Set<Integer> set2 = new HashSet<Integer>();
        set1.add(3);
        set1.add(2);
        set1.add(4);
        set1.add(1);


        set2.add(5);
        set2.add(3);
        set2.add(99);
        set2.add(1);
        Set<Integer> result = findIntersection(set1, set2);
        Set<Integer> result2 = findUnion(set1, set2);
        // System.out.println(result);  
        
        

    }

    private static Set findUnion(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> resultSet = new HashSet();
        resultSet.addAll(set1);
        resultSet.addAll(set2);
        return resultSet;
    }

    private static Set findIntersection(Set<Integer> set1, Set<Integer> set2) {

        // we only need to convert one set into an array
        Integer[] set1Arr = set1.toArray(new Integer[set1.size()]);
        Set<Integer> resultSet = new HashSet<Integer>();

        // if any items in our converted array is in set2 we add it to our result set
        for(int i = 0; i < set1Arr.length; i++){
            if(set2.contains(set1Array[i])){
                resultSet.add(set1Arr[i]);
            }
        }
        return resultSet;

    }
}


