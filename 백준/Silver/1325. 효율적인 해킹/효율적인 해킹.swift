import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = Array(repeating: [Int](), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    graph[b].append(a) // 역방향 간선
}

func dfs(_ start: Int, _ visited: inout [Bool]) -> Int {
    var count = 1
    visited[start] = true
    for next in graph[start] {
        if !visited[next] {
            count += dfs(next, &visited)
        }
    }
    return count
}

var maxHacked = 0
var result = [Int]()

for i in 1...n {
    var visited = Array(repeating: false, count: n + 1)
    let count = dfs(i, &visited)
    if count > maxHacked {
        maxHacked = count
        result = [i]
    } else if count == maxHacked {
        result.append(i)
    }
}

print(result.sorted().map { String($0) }.joined(separator: " "))