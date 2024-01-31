//
//  Practice.swift
//  LeetCode
//
//  Created by 郑智文 on 2024/1/31.
//

import Foundation

class Solution {
    /*
     给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。

     请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

     注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。

      

     示例 1：

     输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     输出：[1,2,2,3,5,6]
     解释：需要合并 [1,2,3] 和 [2,5,6] 。
     合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
     示例 2：

     输入：nums1 = [1], m = 1, nums2 = [], n = 0
     输出：[1]
     解释：需要合并 [1] 和 [] 。
     合并结果是 [1] 。
     示例 3：

     输入：nums1 = [0], m = 0, nums2 = [1], n = 1
     输出：[1]
     解释：需要合并的数组是 [] 和 [1] 。
     合并结果是 [1] 。
     注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。
      

     进阶：你可以设计实现一个时间复杂度为 O(m + n) 的算法解决此问题吗？
     
     */
    
    class func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        if m == 0 && n > 0 {
            var index = 0
            while index < n {
                nums1[index] = nums2[index]
                index += 1
            }
            return
        }
        
        if (n == 0 && m > 0) || (m == 0 && n == 0) {
            return
        }
        
        
        var array = [Int]()
        var index1 = 0;
        var index2 = 0;
        while(index1 < m && index2 < n) {
            let n1 = nums1[index1]
            let n2 = nums2[index2]
            if (n2 <= n1) {
                array.append(n2)
                index2 += 1
            } else {
                array.append(n1)
                index1 += 1
            }
        }
        if index1 >= m && index2 < n {
            while (index2 < n) {
                array.append(nums2[index2])
                index2 += 1
            }
        }
        if index1 < m && index2 > n {
            while(index1 < m) {
                array.append(nums1[index1])
                index1 += 1
            }
        }

        var index = 0
        while(index < m + n) {
            nums1[index] = array[index]
            index += 1
        }
    }
    
    /*M 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使得出现次数超过两次的元素只出现两次 ，返回删除后数组的新长度。
     
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

      

     说明：

     为什么返回数值是整数，但输出的答案是数组呢？

     请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

     你可以想象内部操作如下:

     // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
     int len = removeDuplicates(nums);

     // 在函数里修改输入数组对于调用者是可见的。
     // 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
     for (int i = 0; i < len; i++) {
         print(nums[i]);
     }
      

     示例 1：

     输入：nums = [1,1,1,2,2,3]
     输出：5, nums = [1,1,2,2,3]
     解释：函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3。 不需要考虑数组中超出新长度后面的元素。
     示例 2：

     输入：nums = [0,0,1,1,1,1,2,3,3]
     输出：7, nums = [0,0,1,1,2,3,3]
     解释：函数应返回新长度 length = 7, 并且原数组的前七个元素被修改为 0, 0, 1, 1, 2, 3, 3。不需要考虑数组中超出新长度后面的元素。*/
    
    class func removeDuplicates(_ numbers: inout [Int]) -> Int {
        var i = 0
        var j = 0
        var maxI = numbers.count - 3
        var reduceCount = 0
        while i <= maxI {
            if i == j {
                j += 1
                continue
            }
            let valueJ = numbers[j]
            let valueI = numbers[i]
            if valueJ > valueI {
                i = j
                continue
            } else {
                if j - i == 2 {
                    var moveIndex = j - 1
                    while moveIndex < numbers.count - 1 {
                        numbers[moveIndex] = numbers[moveIndex + 1]
                        moveIndex += 1
                    }
                    maxI -= 1
                    reduceCount += 1
                } else {
                    j += 1
                }
            }
        }
        
        return numbers.count - reduceCount
    }
}
