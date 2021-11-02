

/*
In this problem, we will implement an nth root finder. Re-
call that the nth root of x, written n√x, is the number when raised to
the power n gives x. In particular, please fill in the findNthRoot(int
number, int n, int precision) method in the class NthRootFinder.
The method should return a string representing the nth root of number,
rounded to the nearest precision decimal places. If your answer is exact,
you should fill in the answer with decimal places (i.e. with input 41 and
precision 5, we should return 41.00000.) You may notuse any library
functions for this question.

For example, the following input
would generate the output 20.000:
2, 400, 3

Additionally, the following input would generate the output 6.86:
2, 47, 2
*/
public class nthRootFinder {
    public static void main(String[] args) {
        System.out.println(findNthRoot(16, 2, 3));
    }

    private static String findNthRoot(int number, int n, int precision) {
        // Initialize bounds
        double lowerBound = 0.0;
        double upperBound = (double) number;
        
        // compute epsilon, which represents 10^-(2 * precision)
        // this wil give us a really large 1.00000000000000E-10
        double epsilon = 1.0;
        for (int i = 0; i < 2*precision; i++) {
            epsilon *= 0.1;
        }
        
        // Iteratively guess the midpoint and check it
        while (true) {
            double guess = (lowerBound + upperBound) / 2.0;
                        
            // compute guess^n
            double guessToTheN = 1.0;
            for (int i = 0; i < n; i++) {
                guessToTheN *= guess;
            }
            System.out.println(lowerBound);
            System.out.println(upperBound);
            
            // If guess^n is within 2*precision decimal places of number, stop.
            // (We use epsilon from above to do this).
            // Otherwise, update bounds accordingly.
            if ((guessToTheN - number) < epsilon &&
                    (guessToTheN - number) > (-1.0 * epsilon)) {
                return String.format("%." + precision + "f", guess);
            } else if (guessToTheN < number) {
                lowerBound = guess;
            } else if (guessToTheN > number) {
                upperBound = guess;
            } else {
                // should never get here
                throw new UnsupportedOperationException();
            }
            
        }        
    }
}
