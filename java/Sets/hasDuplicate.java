/*
Implement the function hasDuplicates in the class DuplicateWordFinder.
Input will be given as a line containing a positive integer n, followed by
n rows, each containing a string. Output should be either the word true
if there are any duplicates among these strings or false if there are not.
Your code should work well on long lists of strings.
*/


import java.lang.UnsupportedOperationException;
import java.util.Set;
import java.util.HashSet;

public class DuplicateWordFinder {
    public static void main(String[] args) {
        String[] arrFalseCase = {"Chakane", "Joey", "Chris", "Mike", "Stan", "Ricky"};
        String[] arrTrueCase = {"Chakane", "Joey", "Chris", "Mike", "Stan", "Ricky"};
        boolean result = hasDuplicates(arrFalseCase);
        System.out.println(result);
    }

    private static boolean hasDuplicates(String[] stringsArray) {
        Set<String> testSet = new HashSet();
        for(int i = 0; i < stringsArray.length; i++) {
            if(testSet.contains(stringsArray[i])) {
                return true;
            } else {
                testSet.add(stringsArray[i]);
            }
        }
        return false;
    }
}