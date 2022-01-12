/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
"""
 1
[1,1] [1,1]

collect each element,
if element is not a list, add it to the level multiplier
at end of list add to totalSum
if you hit a list, recursively repeat
recursion = depth + 1
"""
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var totalSum = 0
        func dfs(_ list: [NestedInteger], _ depth: Int) {
            var levelSum = 0            
            for int in list {
                if int.isInteger() {
                    levelSum += int.getInteger() * depth
                } else {
                    dfs(int.getList(), depth + 1)
                }
            }
            totalSum += levelSum
        }
        dfs(nestedList, 1)
        return totalSum
    }
}