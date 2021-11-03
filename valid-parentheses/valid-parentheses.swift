"""
Since you're finding the "reverse" of a relative string, we can use a stack.

So how would we do this? Let's try iterating through and adding to the stack as we go. How do we know we reach the opposite? We can look at the "last" item that's put on the stack and see if there's a matching bracket.

Observations: Valid strings are size n % 2 == 0
If a string is valid, the middle will always have two of the same types. i.e. ({}) has {}. You can't have ([}).
If you try a palindrome checker approach you run into a sequence of different brackets that could be valid. Therefore, your stack has to be relative.


For each left bracket, try adding that to a stack. For each right bracket, pop off the most recently seen item on the stack and compare it to your right bracket. If it's matching, then you have a valid pair.

aapapp -> each a is accompanied by a p
({}[])

If the stack is odd numbered by the time you get to the end, then it's false. You can even check it beforehand for a faster optimization. If you don't have a matching pair, your pop will not match your push, so it's invalid.


Time: O(n) where n is the string size
Space: O(n) where n is the string size. If you have all left brackets then you take up the entire n.
"""
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        let brackets: [Character:Character] = ["}": "{", "]":"[", ")":"("]
        var stack: [Character] = []
        let array = Array(s)
        for char in array {
            // left bracket
            if brackets[char] == nil {
                stack.append(char)
            } else {
                // right bracket
                if stack.isEmpty {
                    return false
                }
                let popped = stack.removeLast()
                if popped != brackets[char] {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}