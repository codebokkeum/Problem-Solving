let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = ab.first!, b = ab.last!

print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a % b)