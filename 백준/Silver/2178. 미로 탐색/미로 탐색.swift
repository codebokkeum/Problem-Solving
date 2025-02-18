import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var queue = Queue<(Int, Int)>()
var answer = 1

for _ in 0..<n {
  map.append(
    readLine()!.map { Int(String($0))! }
  )
}

struct Queue<T> {
  var queue: ArraySlice<T> = []
  
  var front: T? {
    return queue.first
  }
  
  var count: Int {
    return queue.count
  }
  
  var isEmpty: Bool {
    return queue.isEmpty
  }
  
  mutating func enqueue(_ value: T) {
    queue.append(value)
  }
  
  mutating func dequeue() -> T? {
    guard !queue.isEmpty else { return nil }
    return queue.removeFirst()
  }
  
}

func bfs(_ x: Int, _ y: Int) {
  
  visited[y][x] = 1
  queue.enqueue((x, y))
  
  while !queue.isEmpty {
    guard let (x, y) = queue.dequeue() else { break }
    
    for i in 0..<4 {
      let nx = dx[i] + x
      let ny = dy[i] + y
      guard (0..<m ~= nx) && (0..<n ~= ny) else { continue }
      guard visited[ny][nx] == 0 else { continue }
      guard map[ny][nx] == 1 else { continue }
      queue.enqueue((nx, ny))
      visited[ny][nx] = 1
      map[ny][nx] = map[y][x] + 1
    }
  }
}

bfs(0, 0)

print(map[n-1][m-1])