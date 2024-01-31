//
//  main.swift
//  LeetCode
//
//  Created by 郑智文 on 2024/1/31.
//

import Foundation

//var nums1 = Array(repeating: 0, count: 1)
//var nums2 = [1]
//Solution.merge(&nums1, 0, nums2, 1)
//print(nums1)

var nums = [1]
let count = Solution.removeDuplicates(&nums)
var index = 0
while index < count {
    print("\(nums[index])")
    index += 1
}

