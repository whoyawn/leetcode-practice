class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var low = prices[0]
        var profit = 0
        for price in prices {
            if price > low {
                profit = max(profit, price - low)
            }
            low = min(low, price)
        }
        return profit
    }
}