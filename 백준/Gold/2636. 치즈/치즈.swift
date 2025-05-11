import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func meltCheese(_ cheese: inout [[Int]], _ visited: inout [[Bool]], _ n: Int, _ m: Int) -> [(Int, Int)] {
  var queue = ArraySlice([(0, 0)])
  visited[0][0] = true
  var melted = [(Int, Int)]()
  
  while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    
    for i in 0..<4 {
      let nx = dx[i] + x
      let ny = dy[i] + y
      
      guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
      
      if !visited[nx][ny] {
        if cheese[nx][ny] == 0 {
          visited[nx][ny] = true
          queue.append((nx, ny))
        } else if cheese[nx][ny] == 1 {
          visited[nx][ny] = true
          melted.append((nx, ny))
        }
      }
    }
  }
  return melted
}

func solve(_ map: inout [[Int]], _ n: Int, _ m: Int) -> (Int, Int) {
  var time = 0
  var lastCheeseCount = 0
  
  while true {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    let meltedList = meltCheese(&map, &visited, n, m)
    
    if meltedList.isEmpty { break }
    lastCheeseCount = meltedList.count
    
    for (x, y) in meltedList {
      map[x][y] = 0
    }
    time += 1
  }

  return (time, lastCheeseCount)
}

let size = readLine()!.split(separator: " ").map { Int($0)! }
let height = size.first!, width = size.last!
var cheese = [[Int]]()

for _ in 0..<height {
  cheese.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let answer = solve(&cheese, height, width)

print(answer.0)
print(answer.1)