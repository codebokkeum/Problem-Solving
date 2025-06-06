import Foundation

let hw = readLine()!.split(separator: " ").map { Int($0)! }
let h = hw[0], w = hw[1]

var map: [[Character]] = []
var landCoordinates: [(r: Int, c: Int)] = []

for r in 0..<h {
    let row = Array(readLine()!)
    for c in 0..<w {
        if row[c] == "L" {
            landCoordinates.append((r, c))
        }
    }
    map.append(row)
}

func bfs(x: Int, y: Int) -> Int {
    var maxDistance = 0
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    var queue: [(r: Int, c: Int, time: Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)

    queue.append((r: x, c: y, time: 0))
    visited[x][y] = true

    var head = 0
    while head < queue.count {
        let current = queue[head]
        head += 1
        
        maxDistance = max(maxDistance, current.time)
      
        for i in 0..<4 {
            let nx = current.r + dx[i]
            let ny = current.c + dy[i]

            guard nx >= 0, nx < h, ny >= 0, ny < w else { continue }
            guard !visited[nx][ny] else { continue }
            guard map[nx][ny] == "L" else { continue }

            visited[nx][ny] = true
            queue.append((r: nx, c: ny, time: current.time + 1))
        }
    }
    
    return maxDistance
}

var maxTotalTime = 0

for land in landCoordinates {
    let time = bfs(x: land.r, y: land.c)
    maxTotalTime = max(maxTotalTime, time)
}

print(maxTotalTime)