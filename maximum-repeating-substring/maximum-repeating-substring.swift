/**

word = ab
seq = abccabababc <- 3

repeating = potential max
end of word, local max += 1
mismatch = reset word pointer, reset local max

time: O(n)
space: O(n)

seq = "a"
word = "ab"

"aaaba aaaba aab|  a aa|a|ba aaaba aaaba aaaba"
"aaaba"

"aaa"
"a"

aaaaba aaaba aaaba aaaba
"aaaabaaaabaaaabaaaaba"
"aaaba"

aaabaa

abcab

ab
*/
class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        guard word.count <= sequence.count else { return 0 }
        var maxKRepeating = 0
        var si = 0
        var wi = 0
        var localMax = 0
        var wordArr = Array(word)
        var seqArr = Array(sequence)
        for starting in (0..<(sequence.count - word.count + 1)) {
            localMax = 0
            wi = 0
            si = starting
            while si < sequence.count && wordArr[wi] == seqArr[si] {
                if wi == word.count - 1 {
                    localMax += 1
                    maxKRepeating = max(maxKRepeating, localMax)
                    wi = -1
                }
                wi += 1
                si += 1
            }
        }
        return maxKRepeating
    }
}