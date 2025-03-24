import Foundation

func quad(x: Int, y: Int, n: Int) -> String {
  
  if n == 1 { return "\(map[y][x])" }
  
  let b = map[y][x]
  var ret = ""
  
  for i in y..<y+n {
    for j in x..<x+n {
      if b != map[i][j] {
        ret += "("
        ret += quad(x: x, y: y, n: n/2)
        ret += quad(x: x + n/2, y: y, n: n/2)
        ret += quad(x: x, y: y + n/2, n: n/2)
        ret += quad(x: x + n/2, y: y + n/2, n: n/2)
        ret += ")"
        return ret
      }
    }
  }
  return "\(map[y][x])"
}

let N = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<N {
  map.append(readLine()!.map { Int(String($0))!} )
}

print(quad(x: 0, y: 0, n: N))