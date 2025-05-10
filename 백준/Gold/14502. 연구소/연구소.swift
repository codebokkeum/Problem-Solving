import Foundation

extension Array {
  func combinations(ofCount r: Int) -> [[Element]] {
    if r == 0 { return [[]] }
    if self.isEmpty { return [] }
    
    var result: [[Element]] = []
    let rest = Array(self.dropFirst())
    
    for comb in rest.combinations(ofCount: r - 1) {
      result.append([self[0]] + comb)
    }
    result += rest.combinations(ofCount: r)
    return result
  }
}

func spreadVirus(x: Int, y: Int, map: inout [[Int]]) {
  let dx = [-1, 1, 0, 0]
  let dy = [0, 0, -1, 1]
  
  if map[x][y] == 2 {
    for i in 0..<4 {
      let nx = dx[i] + x
      let ny = dy[i] + y
      
      guard 0..<map.count ~= nx && 0..<map.first!.count ~= ny else { continue }
      guard map[nx][ny] == 0 else { continue }
      map[nx][ny] = 2
      spreadVirus(x: nx, y: ny, map: &map)
    }
  }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var blanks: [(Int, Int)] = []
var originalMap: [[Int]] = []
var answer = 0

for _ in 0..<n {
  originalMap.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<n {
  for j in 0..<m {
    if originalMap[i][j] == 0 {
      blanks.append((i,j))
    }
  }
}

let combinations = blanks.combinations(ofCount: 3)

for combination in combinations {
  var map = originalMap  
  for (x, y) in combination {
    map[x][y] = 1
  }
  
  for i in 0..<n {
    for j in 0..<m {
      if map[i][j] == 2 {
        spreadVirus(x: i, y: j, map: &map)
      }
    }
  }

  let safeZone = map.flatMap { $0 }.filter { $0 == 0 }.count
  answer = max(answer, safeZone)
}

print(answer)