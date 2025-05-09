import Foundation

func calculateSecondsBetweenTwoTimes(now: String) -> Int {
  return calculateTimetoSecond(string: now) - calculateTimetoSecond(string: lastScoredTime)
}

func calculateTimetoSecond(string: String) -> Int {
  let times = string.split(separator: ":").map { Int($0)! }
  return times.first! * 60 + times.last!
}

func printTime(second: Int) -> String {
  let minute = "00" + "\(second / 60)"
  let minuteStartIndex = String.Index(utf16Offset: minute.count-2, in: minute)
  let minuteEndIndex = String.Index(utf16Offset: minute.count-1, in: minute)
  
  let second = "00" + "\(second % 60)"
  let secondStartIndex = String.Index(utf16Offset: second.count-2, in: second)
  let secondEndIndex = String.Index(utf16Offset: second.count-1, in: second)
  
  return minute[minuteStartIndex...minuteEndIndex] + ":" + second[secondStartIndex...secondEndIndex]
}

let N = Int(readLine()!)!

var aScore = 0
var bScore = 0
var aSum = 0
var bSum = 0
var lastScoredTime = ""

for _ in 0..<N {
  let splitted = readLine()!.split(separator: " ")
  let currentTime = String(splitted.last!)
  if aScore > bScore {
    aSum += calculateSecondsBetweenTwoTimes(now: currentTime)
  } else if bScore > aScore {
    bSum += calculateSecondsBetweenTwoTimes(now: currentTime)
  }
  Int(splitted.first!)! == 1 ? (aScore += 1) : (bScore += 1)
  lastScoredTime = currentTime
}

if aScore > bScore {
  aSum += calculateSecondsBetweenTwoTimes(now: "48:00")
} else if bScore > aScore {
  bSum += calculateSecondsBetweenTwoTimes(now: "48:00")
}

print(printTime(second: aSum))
print(printTime(second: bSum))