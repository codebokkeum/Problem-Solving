import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let j = Int(readLine()!)!
var positions = [Int]()
var currentRange = 0...(m - 1)
var answer = 0

for _ in 0..<j {
  positions.append(
    Int(readLine()!)! - 1
  )
}

positions.forEach {
  if !(currentRange ~= $0) {
    if $0 < currentRange.lowerBound {
      let distance = abs(currentRange.lowerBound - $0)
      answer += distance
      currentRange = $0...$0+m-1
    } else if $0 > currentRange.upperBound {
      let distance = abs($0 - currentRange.upperBound)
      answer += distance
      currentRange = $0-m+1...$0
    }
  }
}

print(answer)