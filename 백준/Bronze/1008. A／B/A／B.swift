let ab = readLine()!.split(separator: " ").map { Double($0)! }
let a = ab.first!, b = ab.last!

print(a / b)