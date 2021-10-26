"""
last index matters?

you know how to reach the index 

[0 3 0 1  ] -> jumps to last
[t t f t  ]
[2,3,1,1,4]

[t t t  ]
[1,1,1,1]

[t t  ]
[1,2,3]

[t  ]
[2,3]

[f f t f  ]
[3,2,2,0,4]

constraint: you start at i = 0
requirement: you need to end at len - 1

optimal is least jumps total

if you have a t at i = 0, then true

false array
from the last one to the first one, calculate all subarrays until you get to j = 0

f(x) = nums[i] + i >= len(nums) - 1 == jumpable
"""

class Solution:
    def canJump(self, nums: List[int]) -> bool:
        end = len(nums) - 1
        for i in range(len(nums) - 1, -1, -1):
            if nums[i] + i >= end:
                end = i
        return True if end == 0 else False
            