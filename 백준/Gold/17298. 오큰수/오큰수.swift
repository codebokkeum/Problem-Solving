import Foundation

let n = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }

var answers = Array(repeating: -1, count: n)
var stack = [Int]()

for i in 0..<n {
  while let last = stack.last, A[last] < A[i] {
    answers[last] = A[i]
    let _ = stack.popLast()
  }
  stack.append(i)
}

print(answers.map { String($0) }.joined(separator: " "))