"""

pred:
abc -> abac
    -> aabc
    -> abca
    -> abbc

1. create set of word
2. from the biggest word , going one at a time take off a letter and see if word is in dict
3. if word is in, then for that word we memoize and set length so far to that word
4. update max so far
"""
class Solution {
    var wordSet: Set<String>!
    func longestStrChain(_ words: [String]) -> Int {
        var maxChain = 1
        let words = words.sorted()
        var memo: [String:Int] = [:]
        wordSet = Set(words)
        for word in words {
            maxChain = max(maxChain, dfs(word, &memo))
        }
        return maxChain
    }
    
    func dfs(_ curWord: String, _ memo: inout [String:Int]) -> Int {
        if let val = memo[curWord] {
            return val
        }
        var maxLength = 1
        for i in 0..<curWord.count {
            var arr = Array(curWord)
            arr.remove(at: i)
            let newWord = String(arr)
            if wordSet.contains(newWord) {
                let newLength = 1 + dfs(newWord, &memo)
                maxLength = max(maxLength, newLength)
            }
        }
        memo[curWord] = maxLength
        
        return maxLength
    }
}