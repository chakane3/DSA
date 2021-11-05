
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
import Foundation
class NthRootFinder {
    static func findNthRoot(num number: Double, power num: Int, precision: Int ) -> String {

        // create bounds
        var lowerBound: Double = 0.0
        var upperBound: Double = Double(number)

        // compute epsilon, which represents 10^2-(2 * precision)
        // this gives a huge 1.00000000E-10
        var epsilon: Double = 1.0
        for _ in 0..<2*precision {
            epsilon *= 0.1
        }

        // add the upper and lowerbounds together and cut it in half until we get our answer
        // we update the bounds as we go along
        while true {
            let guess: Double = (lowerBound + upperBound) / 2.0

            // compute guess^n
            var guesstoTheN = 1.0
            for _ in 0..<num {
                guesstoTheN *= guess
            }

            // if guess^n is within  2*precision decimal places of the number, stop
            // otherwise update bounds accordingly. 
            if( (guesstoTheN - number) < epsilon && (guesstoTheN - number) > (-1.0 * epsilon) ) {
                return String(format: "%.\(precision)f", arguments: [guess])
            } else if(guesstoTheN < number) {
                lowerBound = guess
            } else if(guesstoTheN > number) {
                upperBound = guess
            } else {
                return "should not get to this point"
            }
        }
    }
}
print(NthRootFinder.findNthRoot(num: 400, power: 2, precision: 2))
