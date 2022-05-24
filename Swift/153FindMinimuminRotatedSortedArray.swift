//
//  153FindMinimuminRotatedSortedArray.swift
//  LeetCodeSolutions
//
//  Created by Kai Reichow on 5/23/22.
//

import Foundation

//var nums: [Int] = [4,5,6,7,0,1,2];
// so the only instance where left > right in a sorted array is the min
// this can be used to find max, the position of the element tells how many times
// it has been sorted

func findMin(_ nums: [Int]) -> Int {
    var left: Int = 0;
    var right: Int = nums.count - 1;
    
    while(left < right) {
        var mid: Int = left + (right - left)/2;
        
        //the check is well is mid, the smallest element, is less than the element
        // before it. that is the solving check however because we do - 1
        // we need to think of where would this code break, since array no negative
        // indexes so the stipulation is mid must be > 0
        if(mid > 0 && nums[mid] < nums[mid-1]) {
            return nums[mid];
            
        // if the solution check fails we need to decide how we cut the array size in half
        // well we have the two tails, left and right so we compare it to the middle
        // if the left is <= middle we know all of those elements are sorted
        // but we also want to know if mid is greater than right
        // if all elements to the left are less than mid but mid is greater than the right element
        // we set our new left to mid + 1 since mid was already checked
        // the else is the opposite of this case so we set right to mid - 1
        } else if (nums[left] <= nums[mid] && nums[mid] > nums[right]) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    // lastly if we don't return our solution inside the loop
    // we return left since this would be where the min element is at index 0
    // where left is > right but its index 0 so we return left
    return nums[left];
}
