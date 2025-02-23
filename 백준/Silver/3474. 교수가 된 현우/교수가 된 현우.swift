let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    var count = 0
    var divisor = 5

    while N / divisor > 0 {
        count += N / divisor
        divisor *= 5
    }

    print(count)
}