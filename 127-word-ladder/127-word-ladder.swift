class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var queue: [String] = [beginWord]
        var visited = Set<String>()
        var possibleWords: [String:[String]] = [:]
        
        for word in wordList {
            var arr = Array(word)
            for i in 0..<arr.count {
                let temp = arr[i]
                arr[i] = "*"
                possibleWords[String(arr), default:[]].append(word)
                arr[i] = temp
            }
        }
        print(possibleWords)
                
        var level = 1
        while !queue.isEmpty {
            let nodesInLevel = queue.count
            for _ in 0..<nodesInLevel {
                let cur = queue.removeFirst()

                guard !visited.contains(cur) else { continue }
                if cur == endWord {
                    return level
                }
                visited.insert(cur)
                
                var arr = Array(cur)
                for i in 0..<arr.count {
                    let temp = arr[i]
                    arr[i] = "*"
                    if let words = possibleWords[String(arr)] {
                        for word in words {
                            queue.append(word)
                        }
                    }
                    arr[i] = temp
                }
            }
            level += 1
        }
        return 0
    }
    // hit -> hot
    // hit -> hhit
    // hit -> hitt
    func isValidTransformation(_ word1: String, _ word2: String) -> Bool {
        if abs(word1.count - word2.count) > 1 { return false }
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        if word1.count == word2.count {
            var diffs = 0
            var (l, r) = (0, 0)
            
            while l < word1.count {
                if arr1[l] != arr2[r] {
                    diffs += 1
                }
                l += 1
                r += 1
            }
            return diffs == 1
        } else {
            let longer = word1.count > word2.count ? arr1 : arr2
            let shorter = word1.count > word2.count ? arr2 : arr1
    
            return Array(longer[1..<longer.count]) == shorter || Array(longer[0..<longer.count-1]) == shorter
        }
    }
}