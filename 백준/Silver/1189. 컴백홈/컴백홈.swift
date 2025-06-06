import Foundation

let RCK = readLine()!.split(separator: " ").map { Int($0)! }
let R = RCK.first!, C = RCK[1], K = RCK.last!
var map: [[Character]] = []

for _ in 0..<R {
  map.append(Array(readLine()!))
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: C), count: R)
var answer = 0

func dfs(x: Int, y: Int, distance: Int) {
  
  if x == 0 && y == C - 1 {
    if distance == K { answer += 1 }
    return
  }
  
  let dx = [-1, 1, 0, 0]
  let dy = [0, 0, -1, 1]
  
  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]
    
    guard 0 <= nx, nx < R, 0 <= ny, ny < C else { continue }
    guard !visited[nx][ny] else { continue }
    guard map[nx][ny] == "." else { continue }
    
    if distance + 1 > K { continue }
    
    visited[nx][ny] = true
    dfs(x: nx, y: ny, distance: distance + 1)
    visited[nx][ny] = false
  }
}

visited[R - 1][0] = true
dfs(x: R - 1, y: 0, distance: 1)

print(answer)