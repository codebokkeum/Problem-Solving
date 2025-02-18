import Foundation

let n = Int(readLine()!)!
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var answer = 1

for _ in 0..<n {
  map.append(
    readLine()!.split(separator: " ").map { Int($0)! }
  )
}


func dfs(_ y: Int, _ x: Int, height: Int) {
  visited[y][x] = true
  
  for i in 0..<4 {
    let ny = y + dy[i]
    let nx = x + dx[i]
    
    guard (0..<n ~= ny) && (0..<n ~= nx) else { continue }
    guard !visited[ny][nx] else { continue }
    guard map[ny][nx] > height else { continue }
    
    dfs(ny, nx, height: height)
  }
}

for h in 1...100 {
  visited = Array(repeating: Array(repeating: false, count: n), count: n)
  var count = 0
  for j in 0..<n {
    for i in 0..<n {
      if map[j][i] > h && !visited[j][i] {
        dfs(j, i, height: h)
        count += 1
      }
    }
  }
  answer = max(answer, count)
}

print(answer)