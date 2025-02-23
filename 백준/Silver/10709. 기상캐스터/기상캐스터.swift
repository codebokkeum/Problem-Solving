let HW = readLine()!.split(separator: " ").map { Int($0)! }
let H = HW[0], W = HW[1]
var map: [[String]] = []

for _ in 0..<H {
  map.append(
    readLine()!.map { String($0) }
  )
}

var answer = Array(repeating: Array(repeating: 0, count: W), count: H)

for i in 0..<H {
  for j in 0..<W {
    if map[i][j] == "c" {
      answer[i][j] = 0
    } else {
      if let index = map[i][0..<j].lastIndex(of: "c") {
        answer[i][j] = j - index
      } else {
        answer[i][j] = -1
      }
    }
  }
}

answer.forEach {
  $0.forEach { print($0, terminator: " ") }
  print()
}