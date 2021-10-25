"""
only can delete one
so at best, word is one off from palindrome
at worst, you delete one and nothing happens

if it is an odd palindrome, then true

brute force, delete char 1 by 1, check if palindrome

O(n) <- scanning
checking -> O(n)

palindromes even -> reflective
odd -> reflective except the middle character

substrings of palindromes from the middle are also palindromes

if even, deleting = odd
if odd, d -> even

at max, check 1 off

compare reverse, how many diffs can you find?
  x
abca
 x
acba

abc

bca

aabb -> true

bbaa

bab

aba

bcabab

babacb

string already looks lihk almost palindrome

if i ignore the right, can i ignore the left mirror as well?

aaabdaaa

aabbca -> aabba

aabbcaa -> 

at most i can just ignore one

"""
class Solution:
    def validPalindrome(self, s: str) -> bool:
        l = 0
        r = len(s) - 1
        rpalindromable = True
        lpalindromable = True

        # ignore right side
        ignore = 2
        while l < r:
            if s[l] != s[r]:
                if ignore == 2:
                    r -= 1
                    ignore -= 1
                    continue
                else:
                    rpalindromable = False
            l += 1
            r -= 1
        # ignore left side
        l = 0
        r = len(s) - 1
        while l < r:
            if s[l] != s[r]:
                if ignore == 1:
                    l += 1
                    ignore -= 1
                    continue
                else:
                    lpalindromable = False
            l += 1
            r -= 1
        return lpalindromable or rpalindromable
            
            