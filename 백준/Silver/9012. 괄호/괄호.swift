import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
  
  var parenthesis = readLine()!
  var stack = [String]()
  
  for _ in 0..<parenthesis.count {
    guard let last = parenthesis.popLast() else { break }
    
    if stack.isEmpty {
      stack.append(String(last))
    } else {
      if stack.last! == ")" && stack.last! != String(last) {
        let _ = stack.popLast()
      } else {
        stack.append(String(last))
      }
    }
  }
  
  print(stack.isEmpty ? "YES" : "NO")
}