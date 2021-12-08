"""
practice: [0]
perfect: [2]
coding: [3, 7]
makes: [1, 4, 6]
"""
class WordDistance {
    
    var dict: [String:[Int]] = [:]

    init(_ wordsDict: [String]) {
        for (i, word) in wordsDict.enumerated() {
            dict[word, default: []].append(i)
        }
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        var localMin = Int.max
        var word1Indices = dict[word1]!
        var word2Indices = dict[word2]!
        for w1i in word1Indices {
            for w2i in word2Indices {
                localMin = min(localMin, abs(w1i - w2i))
            }
        }
        return localMin
    }
}

/**
 * Your WordDistance object will be instantiated and called as such:
 * let obj = WordDistance(wordsDict)
 * let ret_1: Int = obj.shortest(word1, word2)
 */