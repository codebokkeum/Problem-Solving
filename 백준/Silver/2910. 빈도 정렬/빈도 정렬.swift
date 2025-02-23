import Foundation

let nc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nc[0], c = nc[1]

var progression = readLine()!.split(separator: " ").map { Int($0)! }

var dict: [Int: Int] = [:]
progression.forEach {
  dict[$0, default: 0] += 1
}

let answer = dict.sorted {
  if $0.value == $1.value {
    return progression.firstIndex(of: $0.key)! < progression.firstIndex(of: $1.key)!
  }
    return $0.value > $1.value
}

for (key, value) in answer {
  for _ in 0..<value {
    print(key, terminator: " ")
  }
}