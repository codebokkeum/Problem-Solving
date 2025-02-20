import Foundation

let mnk = readLine()!.split(separator: " ").map { Int($0)! }
let m = mnk[0], n = mnk[1], k = mnk[2]
var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

for _ in 0..<k {
  let xy = readLine()!.split(separator: " ").map { Int($0)! }
  let x1 = xy[0], y1 = xy[1], x2 = xy[2], y2 = xy[3]
  
  for i in y1..<y2 {
    for j in x1..<x2 {
      map[i][j] = 1
    }
  }
}

func dfs(_ y: Int, _ x: Int, visited: inout [[Bool]]) {
  visited[y][x] = true
  count += 1
  
  for i in 0..<4 {
    let ny = y + dy[i]
    let nx = x + dx[i]
    
    guard 0..<m ~= ny && 0..<n ~= nx else { continue }
    guard !visited[ny][nx] else { continue }
    guard map[ny][nx] == 0 else { continue }
    
    visited[ny][nx] = true
    dfs(ny, nx, visited: &visited)
  }
}

var count = 0
var answers = [Int]()

for j in 0..<m {
  for i in 0..<n {
    if map[j][i] == 0 && !visited[j][i] {
      dfs(j, i, visited: &visited)
    }
    if count != 0 {
      answers.append(count)
      count = 0
    }
  }
}

print(answers.count)
answers.sorted(by: <).forEach { print($0, terminator: " ") }