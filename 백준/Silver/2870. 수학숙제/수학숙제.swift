import Foundation

let N = Int(readLine()!)!
var numbers = [String]()

for _ in 0..<N {
    let line = readLine()!
    
    var currentNumber = ""
    
    for char in line {
        if char.isNumber {
            currentNumber.append(char)
        } else if !currentNumber.isEmpty {
            numbers.append(removeLeadingZeros(from: currentNumber))
            currentNumber = ""
        }
    }

    if !currentNumber.isEmpty {
        numbers.append(removeLeadingZeros(from: currentNumber))
    }
}

numbers.sort { 
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}

for num in numbers {
    print(num)
}

func removeLeadingZeros(from number: String) -> String {
    let trimmed = number.drop { $0 == "0" }
    return trimmed.isEmpty ? "0" : String(trimmed)
}