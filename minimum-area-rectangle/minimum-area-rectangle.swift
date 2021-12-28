"""
rectangle: left right up down
left: top left and bottom left same x
right: same x, diff from left
top: top left and top right same y
bottom: bottom left and bottom right same y, diff from top

map x
map y

start bottom right
create square
calculate area

iterate through, find bottom left and top right
if top left and bottom right exist, calculate area
   x
      x


x1 y1.  x2 y2

x2 y1  x1 y2


x1y1 x2y2
x2y1 x1y2
"""
class Solution {
    func minAreaRect(_ points: [[Int]]) -> Int {
        var pointsSet = Set<[Int]>()
        for point in points {
            pointsSet.insert(point)
        }
        
        var minRect = Int.max
        
        for start in points {
            for diagonal in points where start != diagonal {
                let height = abs(start[1] - diagonal[1])
                let width = abs(start[0] - diagonal[0])
                if pointsSet.contains([diagonal[0], start[1]]) && pointsSet.contains([start[0], diagonal[1]]) && height > 0 && width > 0 {
                    minRect = min(minRect, height * width)
                }
            }
        }
        
        return minRect == Int.max ? 0 : minRect
    }
}