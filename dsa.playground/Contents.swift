import UIKit

// General DSA problem's solutions from code platforms


// MARK: - Matching Characters

// ! It's not taking into account the repeated characters !
// Given an array k of names, return the characters that exist in every name in the array (also taking into account the repeated characters).

// Example 1:
// Input: k = ["nellie", "leslie", "stella"]
// Output: ["e", "l", "l"]

// Example 2:
// Input: k = ["cool", "lock", "cook"]
// Output: ["c", "o"]

// Constraints:
// 1 <= k.length <= 100
// 1 <= k[i].length <= 100
// k[i] consists of lower-case English letters.

func matchingCharacters(names: [String]) -> [String] {
    guard !names.isEmpty else { return [] }
    var commonChars = Set(names[0])

    for name in names[1...] {
        commonChars = commonChars.intersection(Set(name))
    }

    return commonChars.map { String($0) }
}

print(matchingCharacters(names: ["nellie", "leslie", "stella"]))
// Result: ["e", "l"]


// MARK: - Phone bill

// ! It's not passing some edge test cases !
// Given a phone calls log in the form of a string with each record separated by \n (ascii code 10) calculate the total phone bill.
// Each record is correctly formed as "HH:MM:SS,nnn-nnn-nnn" e.g. "00:01:07,400-234-090" refers to a phone call to phone number 400-234-090 and lasted a duration of 1 minute and 7 seconds.
// Rules for calculating charges:
//  (i) For a phone call less than 5 minutes long charge 3 cents per second
//  (ii) For a phone call 5 minutes and longer charge 150 cents per started minute, so for a call of 5 minutes 2 seconds would be charged as a 6 minute call i.e. 6 * 150 = 900 cents
//  (iii) All calls to the phone number with the longest total call duration are free. In the event that two phone numbers have the same total call duration use the one

// For example, given string S with N = 3 lines:
// let phoneBill = """
//     00:01:07,400-234-090
//     00:05:01,701-080-080
//     00:05:00,400-234-090
// """

// The function should return 900 (the total duration for number 400-234-090 is 6 minutes 7 seconds, and the total duration for number 701-080-080 is 5 minutes 1 second; therefore, the free promotion applies to the former phone number).

public func phoneBillChallenge(_ S: String) -> Int {
    let phoneCallDurations = getPhoneCallDurations(from: S)
    return calculateTotalBill(for: phoneCallDurations)
}

private func getPhoneCallDurations(from phoneRecordsString: String) -> [String: Int] {
    var phoneCallDurations: [String: Int] = [:]

    let phoneRecords = phoneRecordsString.components(separatedBy: "\n")

    for record in phoneRecords {
        let components = record.components(separatedBy: ",")

        // Total seconds
        let durationComponents = components[0].components(separatedBy: ":")
        let hours = Int(durationComponents[0]) ?? 0
        let minutes = Int(durationComponents[1]) ?? 0
        let seconds = Int(durationComponents[2]) ?? 0
        let totalSeconds = hours * 3600 + minutes * 60 + seconds

        // Phone number
        let phoneNumber = components[1]

        phoneCallDurations[phoneNumber, default: 0] += totalSeconds
    }

    return phoneCallDurations
}

private func calculateTotalBill(for phoneCallDurations: [String: Int]) -> Int {
    var totalBill = 0
    let taxPerSecond = 3
    let taxPerMinute = 150
    let minutesBillingRule = 5
    let longestDuration = phoneCallDurations.values.max() ?? 0

    for (phoneNumber, durationInSeconds) in phoneCallDurations {
        guard durationInSeconds != longestDuration else { continue }
        let durationInMinutes = durationInMinutes(from: durationInSeconds)

        if durationInMinutes <= minutesBillingRule {
            totalBill += durationInSeconds * taxPerSecond
        } else {
            totalBill += durationInMinutes * taxPerMinute
        }
    }

    return totalBill
}

private func durationInMinutes(from seconds: Int) -> Int {
    let minuteInSeconds = 60.0
    return Int(ceil(Double(seconds) / minuteInSeconds))
}

var phoneBill = """
00:01:07,400-234-090
00:05:01,701-080-080
00:05:00,400-234-090
"""

let totalBill = phoneBillChallenge(phoneBill)
print("Total Phone Bill: \(totalBill) cents")


// MARK: - String logic

// Input: "aaa"
//        "bbb"
//        "abb"
// Output: true

// Input: "abbaba"
//        "ababa"
//        "abba"
// Output: false

public func abbaString(_ S : String) -> Bool {
    var hasB = false

    for char in S {
        if char == "b" {
            hasB = true
        } else if char == "a" && hasB {
            return false
        }
    }

    return true
}
print(abbaString("abba"))


// MARK: - Distance to char

func distanceToChar(_ s: String, _ c: Character) -> [Int] {
    var result = [Int]()
    let enumeratedString = s.enumerated()
    let characterIndices = enumeratedString.compactMap { $1 == c ? $0 : nil }
    for (index, character) in enumeratedString {
        if character == c {
            result.append(0)
        } else {
            result.append(characterIndices.map { abs(index - $0) }.min()!)
        }
    }
    return result
}

print(distanceToChar("loveleetcode", "e"))


// MARK: - Shortest positive integer that's not in the given array

func shortestPositiveInteger(_ A : [Int]) -> Int {
    let nonNegativeValues = Set(A.filter { $0 > 0 })
    if nonNegativeValues.isEmpty {
        return 1
    }

    for i in 1...100_000 {
        if !nonNegativeValues.contains(i) {
            return i
        }
    }

    return 1
}

shortestPositiveInteger([1, 3, 6, 4, 1, 2])
// Result: 5
