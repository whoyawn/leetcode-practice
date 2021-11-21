

class Node {
    var children: [Character:Node] = [:]
    var word: String?
}
// Edge case: Empty trie to ask for one letter. traverse should not mutate trie
// Time: O(k) where k is longest word
// Space: O(n*K) where k is longest word and n is all possible starting letters
class Trie {
    
    var nodes = [Character:Node]()

    init() {}
    
    func insert(_ word: String) {
        var characters = Array(word)
        var letter = nodes[characters[0], default: Node()]
        nodes[characters[0]] = letter
        for i in 1..<word.count {
            let c = characters[i]
            let child = letter.children[c, default: Node()]
            letter.children[c] = child
            letter = child
        }
        letter.word = word
    }
    
    func search(_ word: String) -> Bool {
        let letter = traverse(word)
        return letter?.word != nil
    }
    
    func startsWith(_ prefix: String) -> Bool {
        let letter = traverse(prefix)
        return letter != nil
    }
    
    func traverse(_ word: String) -> Node? {
        var characters = Array(word)
        var letter = nodes[characters[0]]
        for i in 1..<word.count {
            let c = characters[i]
            if let child = letter?.children[c] {
                letter = child
            } else {
                return nil
            }
        }
        return letter
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */