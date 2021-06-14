import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var countArray = [String]()
        var repeatCount = ""
        var wordArray = [String]()
        var result = ""
        
        for element in message {
            if element.isNumber {
                repeatCount = "\(repeatCount)\(element)"
            } else if element == "[" {
                if repeatCount == "" {
                    countArray.append("1")
                } else {
                    countArray.append(repeatCount)
                }
                repeatCount = ""
                wordArray.append(result)
                result = ""
            } else if element == "]" {
                var tempString = ""
                if let counts = Int(countArray.popLast() ?? "1") {
                    for _ in 0..<counts {
                        tempString += result
                    }
                }
                result = wordArray.popLast()! + tempString
            } else if element.isLetter {
                result += String(element)
            }
        }
        
        return result
        }
    }
