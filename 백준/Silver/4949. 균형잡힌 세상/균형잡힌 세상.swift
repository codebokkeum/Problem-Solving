import Foundation

while true {
  guard let line = readLine(), line != "." else { break }
  var parenthesis = Array(line.filter { !$0.isLetter && ($0 != " ") && ($0 != ".") })
  var stack = [Character]()
  
  for _ in 0..<parenthesis.count {
    guard let last = parenthesis.popLast() else {
      break
    }
    
    if stack.isEmpty {
      stack.append(last)
    } else {
      if stack.last! == "]" && last == "[" {
        let _ = stack.popLast()
      } else if stack.last! == ")" && last == "(" {
        let _ = stack.popLast()
      } else {
        stack.append(last)
      }
    }
  }
  print(stack.isEmpty ? "yes" : "no")
}