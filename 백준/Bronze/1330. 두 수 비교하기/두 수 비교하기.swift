let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = ab.first!, b = ab.last!
if a < b {
    print("<")
} else if a == b {
    print("==")
} else {
    print(">")
}