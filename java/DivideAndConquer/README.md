## Divide and Conquer

The main idea here is that we divide everything in conditional halves until we have reached some sort of target or even sort some elements.

A basic approach to this implementing a binary search algorithm.
One assumption we will make is that our list is ordered. 
One thing to notice abut this algrithm below is that our sample size gets smaller

```java
public static boolean binarySearch(int[] arr, int target) {

        // check if theres an ampty array given
        if(arr.length == 0) {
            return false;
        }

        // here we want an the index of the first and last elements in the array
        int lowend = 0;
        int highend = arr.length-1;   

        // we'll keep cutting the problem size in half until either the highend reaches 0
        // or until we find our target
        while(lowend <= highend) {
            int midpoint = highend - lowend / 2;

            // here, our guess was larger than the target
            // therefore we eliminate everything on the right side of the midpoint
            if(arr[midpoint] > target) {
                highend = midpoint-1;
            }

            // here our guess is smaller than the target
            // therefore we  elimiate the left side of the midpoint
            else if(arr[midpoint] < target) {
                lowend = midpoint - 1;

            // we have found the target
            } else {
                return true;
            }
        }
        return false;
    }
```



