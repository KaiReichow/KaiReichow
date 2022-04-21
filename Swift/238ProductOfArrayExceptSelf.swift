//
//  238ProductOfArrayExceptSelf.swift
//  LeetCodeSolutions
//
//  Created by Kai Reichow on 4/21/22.
//

import Foundation

// Test Code Here
//var nums: [Int] = [1, 2, 3, 4];
//var sol: [Int] = productExceptSelfConstantSpace(nums);
//print("\(sol)");

// regular solution
func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    let size: Int = nums.count;
    
    // declar array to hold left and right products and a solution array
    var left_Products: [Int] = [Int](repeating: 1, count: size);
    var right_Products: [Int] = [Int](repeating: 1, count: size);
    var output_Arr: [Int] = [Int](repeating: 0, count: size);
    
    // left products takes product of all elements left of the current element
    // so we set the first index of 0 since no elements left to it so we take the
    // product of 1
    left_Products[0] = 1;
    // right product takes the product of all elements right of the current element
    // so we initially set the right products last element to be 1
    // for same reason as left product
    right_Products[size-1] = 1;
    
    // ****in swift it comes with initalizer to set all values to 1 so this is
    // unessecary in swift but nessecary in other languages
    
    // declare a loop to get product of all elements left of the current index
    // the pattern to accomplish this to multiply the element before current
    // element i. so we multiply i -1 in both left and right and set to current
    // index i. since this patterns requires us to have an element before
    // current i to work with we begin at 1 instead of 0 and which is why we set
    // i 0 to be 1 so 1 * nums[0] just gets us the vaue at that index
    for i in 1..<size {
        left_Products[i] = nums[i - 1] * left_Products[i - 1];
    }
    // not how it ends as well since we never calculate last value in nums[i]
    // but that value in left product contains all products before that index in
    // that index
    
    
    // same logic to calculate right side which is why we set its output value
    // to be 1 so we star one element before the last index element and decrement
    // untill we get to 0
    // since we are flipping this pattern backwards (going down) we need to add an
    // element to get the index before
    for i in (0...size-2).reversed() {
        right_Products[i] = nums[i + 1] * right_Products[i + 1];
    }
    
    // lastly left and right arrays contain the products of all elements
    // except that elements index lastly we multiply the two together to get
    // the solution
    for i in 0..<size {
        output_Arr[i] = left_Products[i] * right_Products[i];
    }
    
    return output_Arr;
}

// constant space solution
func productExceptSelfConstantSpace(_ nums: [Int]) -> [Int] {
    
    let size: Int = nums.count;
    
    var output_Arr: [Int] = [Int](repeating: 1, count: size);
    // the constant space optimization is acomplised by storing
    // left values in the output and using a variable for right
    
    for i in 1..<size {
        output_Arr[i] = nums[i - 1] * output_Arr[i - 1];
    }

    var r: Int = 1;
    for i in (0...size-1).reversed() {
        output_Arr[i] = output_Arr[i] * r;
        r *= nums[i];
    }
    
    return output_Arr;
}

