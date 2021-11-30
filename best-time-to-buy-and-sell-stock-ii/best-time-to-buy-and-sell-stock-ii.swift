class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var profit = 0
        for i in 1..<prices.count {
            if prices[i-1] >= prices[i] {
                continue
            } else {
                profit += prices[i] - prices[i-1]
            }
        }
        return profit
    }
}