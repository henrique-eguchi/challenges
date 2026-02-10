import UIKit

// Sort dates in array.
// Would be a plus if you don't use date formatter

let months = ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"]
let dates = ["1 apr 1994", "5 jan 2004", "30 dec 1999", "30 apr 1999", "8 mar 1994", "29 feb 1996", "18 jul 2005", "18 jun 2002", "23 jul 2012", "20 jul 2005", "18 jul 2009", "7 nov 2005", "12 jul 2001", "3 mar 1998"]

// basic solution

var monthDict = [String: Int]()
var dateComponentsArray: [DateComponents] = []

for (index, month) in months.enumerated() {
    monthDict[month] = index + 1
}

// format each of the dates into an array
for date in dates {
    let dayString = date.split(separator: " ")[0]
    let monthString = date.split(separator: " ")[1]
    let yearString = date.split(separator: " ")[2]
    guard let day = Int(dayString),
          let month = monthDict[String(monthString)],
          let year = Int(yearString)
    else { continue }
    dateComponentsArray.append(DateComponents(year: year, month: month, day: day))
}

// sort the array
let sortedDateComponentsArray = dateComponentsArray.sorted { dateComponent1, dateComponent2 in
    guard let date1 = dateComponent1.date, let date2 = dateComponent2.date else { return false }
    return date1.timeIntervalSince1970 < date2.timeIntervalSince1970
}
print(sortedDateComponentsArray)

extension String {
    func toDate(from dateString: String ) -> Date? {
        
    }

    func toDateComponents() {

        self.
    }
}

struct AppDateComponent: Comparable {
    var day: String
    var month: String
    var year: String

    init?(day: String, month: String, year: String) {

    }

    init?(from dateString: String) {

    }

    init?

    static func == (lhs: AppDateComponent, rhs: AppDateComponent) -> Bool {
        lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year
    }

    static func isValidDate() -> DateComponents? {
        //
    }
}
