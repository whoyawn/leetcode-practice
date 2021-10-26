"""
two indices where i and j are the same and their indices abs diff <= k


only need one of those instances

brute force: check each integer against the rest and then compare

O(n)

i - j <= k

i <= k + j

j <= i - k

j >= i
[1,2,3,1,2,1,6,6,6,6,6,1] = k 2
"""
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        seen = {}
        for i in range(len(nums)):
            if nums[i] not in seen:
                seen[nums[i]] = seen.get(nums[i], 0) + i
            else:
                if abs(i - seen[nums[i]]) <= k:
                    return True
                seen[nums[i]] = i
        return False