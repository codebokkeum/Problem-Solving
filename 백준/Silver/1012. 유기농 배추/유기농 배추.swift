import Foundation

let T = Int(readLine()!)!
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var cabbage: Int = 0

for _ in 0..<T {
  let mnk = readLine()!.split(separator: " ").map { Int($0)! }
  let m = mnk[0], n = mnk[1], k = mnk[2]
  var map = Array(repeating: Array(repeating: 0, count: m), count: n)
  var visited = Array(repeating: Array(repeating: false, count: m), count: n)
  var count = 0

  for _ in 0..<k {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let x = xy[0], y = xy[1]
    map[y][x] = 1
  }
  
  for i in 0..<map[0].count {
    for j in 0..<map.count {
      if map[j][i] == 1 && !visited[j][i] {
        dfs(i, j, &map, &visited)
        count += 1
      }
    }
  }
  
  print(count)
}

func dfs(_ x: Int, _ y: Int, _ map: inout [[Int]], _ visited: inout [[Bool]]) {
  visited[y][x] = true
  
  for i in 0..<4 {
    let ny = dy[i] + y
    let nx = dx[i] + x
    
    guard 0..<map[0].count ~= nx && 0..<map.count ~= ny else { continue }
    guard visited[ny][nx] == false else { continue }
    guard map[ny][nx] == 1 else { continue }
    
    visited[ny][nx] = true
    dfs(nx, ny, &map, &visited)
  }
}