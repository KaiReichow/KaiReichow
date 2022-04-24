//
//  53MaximumSubarray.swift
//  LeetCodeSolutions
//
//  Created by Kai Reichow on 4/24/22.
//

import Foundation

// 53. Maximum Subarray (Easy)

// Given an integer array nums, find the contiguous subarray
// (containing at least one number) which has the largest
// sum and return its sum.

//A subarray is a contiguous part of an array.

// Explanation
// we keep track and build a contiguous sub array in O(n) time
// by adding one element at a time
// each time we add an element we compare
// the current element stored in current_sum + the next element
// is greater than the next element by itself? if it is we assign
// that as the new current_sum or set current_sum to the next element
// i.e restarting the count
// then we compare the current sum with the max sum, taking the max between the two
// this algorithm is extremely simmilar to aplha beta min max which pruns
// unessecary subtrees of a search space
// where the brute force minmax would be o(n^2) the abMinMax would be O(n)

func maxSubArray(_ nums: [Int]) -> Int {
    var max_sum: Int = nums[0];
    var current_sum: Int = max_sum;
    
    for i in 1..<nums.count {
        current_sum = max(nums[i] + current_sum, nums[i]);
        max_sum = max(current_sum, max_sum);
    }
    return max_sum;
}
