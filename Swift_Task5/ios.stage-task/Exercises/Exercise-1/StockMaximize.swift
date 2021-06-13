import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var copyArray = prices
        var profit = 0

        for _ in copyArray {
            let comparablePrice = copyArray[0]
                
            copyArray.removeFirst()
            
            if copyArray.isEmpty { break }
            
            if copyArray.max()! > comparablePrice {
                profit += copyArray.max()! - comparablePrice
            } else {
                continue
            }
        
        }
        return profit
    }
}
