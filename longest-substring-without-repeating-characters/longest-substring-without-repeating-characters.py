"""

longest substring -> 

condition: substring needs to be unique
as we add in the new chacters, if we seen the char already, then its nonunique
"""

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        longest = 0
        seen = set()
        l = 0
        r = 0
        window = 0
        while l < len(s):
            if r < len(s) and s[r] not in seen:
                window += 1
                longest = max(longest, window)
                seen.add(s[r])
                r += 1
            else:
                seen.remove(s[l])
                window -= 1
                l += 1
        return longest