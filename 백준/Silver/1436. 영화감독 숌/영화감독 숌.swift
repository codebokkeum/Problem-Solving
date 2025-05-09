import Foundation

func isContains666(number: Int) -> Bool {
  var number = number
  while number >= 666 {
    if number % 1000 == 666 {
      return true
    }
    number /= 10
  }
  return false
}

var n = Int(readLine()!)!
var currentNumber = 666
var count = 1

while count != n {
  currentNumber += 1
  if isContains666(number: currentNumber) {
    count += 1
  }
}

print(currentNumber)