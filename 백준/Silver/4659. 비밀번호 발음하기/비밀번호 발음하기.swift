import Foundation

func isValidString(_ input: String) -> Bool {
    let pattern = #"^(?=.*[aeiou])(?!.*([aeiou]{3}|[^aeiou]{3}))(?!.*([^eo])\2).*"#
    
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
        return false
    }
    
    let range = NSRange(location: 0, length: input.utf16.count)
    return regex.firstMatch(in: input, options: [], range: range) != nil
}

while true {
  let password = readLine()!
  if password == "end" { break }
  
  if isValidString(password) {
    print("<\(password)> is acceptable.")
  } else {
    print("<\(password)> is not acceptable.")
  }
}