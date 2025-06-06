import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var grid = [[Int]]()
var house = [(Int, Int)]()
var chickenShop = [(Int, Int)]()

for _ in 0..<n {
  grid.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
  for j in 0..<n {
    if grid[i][j] == 1 {
      house.append((i, j))
    } else if grid[i][j] == 2 {
      chickenShop.append((i, j))
    }
  }
}

func calculateChickenDistance(x1: Int, y1: Int, x2: Int, y2: Int) -> Int {
  return abs(x1 - x2) + abs(y1 - y2)
}

let combinations = chickenShop.combinations(ofCount: m)

var answer = Int.max
for combination in combinations {
  var totalChickenDistance = 0
  house.forEach { (x1, y1) in
    var minDistance = Int.max
    combination.forEach { (x2, y2) in
      minDistance = min(minDistance, calculateChickenDistance(x1: x1, y1: y1, x2: x2, y2: y2))
    }
    totalChickenDistance += minDistance
  }
  answer = min(answer, totalChickenDistance)
}

print(answer)

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