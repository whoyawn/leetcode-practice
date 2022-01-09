"""
  0
b d  m
a a a o
d p d m

.ad

end -> val == character and you're at the last char
dfs until at the end of your word or val isn't matching

. = wildcard, look at all children one yes = return

addword:
- go char by char, add in children
- if char doesn't exist create it

at
and
an
add
search: a
"""
class WordDictionary {
    
    var root = Trie("0")

    init() {
        
    }
    
    func addWord(_ word: String) {
        var node = root
        for (i, char) in word.enumerated() {
            if let child = node.children[char] {
                node = child
            } else {
                let newNode = Trie(char)
                if i == word.count - 1 {
                    newNode.isWord = true
                }
                node.children[char] = newNode
                node = newNode
            }
        }
    }
    // does path exist?
    func search(_ word: String) -> Bool {
        var arr = Array(word)
        func validPath(_ node: Trie, _ i: Int) -> Bool {
            // print(arr[i], node.val, i)
            if node.val != arr[i] && arr[i] != "." {
                return false
            }
            if i == word.count - 1 {
                return node.isWord
            }
            // if let child = node.children[arr[i + 1]] {
            //     return validPath(child, i + 1)
            // }
            return node.children.contains(where: { validPath($0.1, i + 1) })
        }
        
        return root.children.contains(where: { validPath($0.1, 0) })
    }
    
}

class Trie {
    var val: Character
    var isWord = false
    var children: [Character:Trie] = [:]
    init(_ val: Character) {
        self.val = val
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */