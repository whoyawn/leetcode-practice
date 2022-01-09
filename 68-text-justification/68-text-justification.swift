"""
fit as many as you can in a line

each line 0 <= distance
|    | 16

average dist from maxWidth of all lines 
5 + 3 + 3 = 11, 8 + 3 + 5
 4.      2.     2.   7.            2.  4          13
["This", "is", "an", "example", "of", "text", "justification."]

word: 1 space
last word: no spaces

[this is an]

each e in output is l = maxWidth
last letter in each line -> dist from maxWidth

[
   "This    is    an ", -> [this,is,an] [t,h,i,s]
   "                ",
   "                ",
   "                "
]

1. pack in each line for output
    if next word is too long, start a new line
    add to justified output
2. return

pad: while diff > 0 loop through and add one space to the end of each word except for last word
return stringified version
"""
class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var preprocessed = [[String]]()
        var line = [String]()
        var currentWidth = maxWidth + 1
        for word in words {
            if currentWidth - (word.count + 1) < 0 {
                preprocessed.append(line)
                line.removeAll()
                currentWidth = maxWidth + 1
            }
            line.append(word)
            currentWidth -= (word.count + 1)
        }
        preprocessed.append(line)
        if let lastLine = preprocessed.last {
            let wordsCount = max(maxWidth - lastLine.reduce(0, { $0 + $1.count + 1}), 0)
            let arr: [Character] = Array(repeating: " ", count: wordsCount)
            preprocessed[preprocessed.count - 1].append(String(arr))
        }
        var justified = [String]()
        for line in preprocessed {
            var charArrays = line.map { Array($0) }
            var difference = maxWidth - line.reduce(0, { $0 + $1.count })
            var i = 0
            while difference > 0 {
                defer {
                    i += 1
                    if i == charArrays.count {
                      i = 0
                    }
                }
                if i == charArrays.count - 1 && charArrays.count != 1 { 
                    continue
                }
                charArrays[i].append(" ")
                difference -= 1
            }
            
            justified.append(charArrays.map { String($0) }.joined())
        }

        return justified
    }
    
    
}