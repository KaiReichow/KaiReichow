//
//  152MaximumProductSubarray.swift
//  LeetCodeSolutions
//
//  Created by Kai Reichow on 4/27/22.
//  solution by mzchen

import Foundation

// edge cases
// all positive
// all negative
// mixed numbers
// contains 0

// continuious chain through array
// we notice as we multiply though the numbers the current total can either be positive
// or negative

// because in the process of finding our solution, largest continusous product of sub array
// we have a tidal wave effect of alternative between positve and negative values
// but because of this we need to keep track of the two extremes because we dont know how they will end
// so we do that but we need to consider the edge case 0 where the tidal sine wave is even, flat
// so we know if it is flat we choose to keep keep or update current max
// but we know if the wave goes negative we need to swap positions of positive and negative since they will change values
// anyway so swap ahead of time to assure smooth sailing

func maxProduct(_ nums: [Int]) -> Int {
    
    // set and store result to first element
    var result: Int = nums[0];
    
    // set and store current max and min to first element
    var maxCurrent: Int = nums[0];
    var minCurrent: Int = nums[0];
    
    for i in (1..<nums.count) {
        
        // if the number is a negative
        // the smaller number potentially goes +
        // the larger number goes -
        if(nums[i] < 0) {
            swap(&maxCurrent, &minCurrent);
        }
        
        // max is 2
        // min is 0
        // next value is -1
        // max is 0
        // min is 2
        // sets max to 0 since > -1
        // sets min to -2 since < 0
        // next value is 1
        // max becoes 1 since > 1* 0
        // min becones -2 since < 1
        
        
        // sets max current to highest value
        // if just current i is - we take the postive because we swapped with min number already
        maxCurrent = max(nums[i], maxCurrent * nums[i]);
        // same with min we swapped with positive so we make it current minimum
        minCurrent = min(nums[i], minCurrent * nums[i]);
        // lastly set result to stay same or update
        result = max(result, maxCurrent);
    }
    
    return result;
}
