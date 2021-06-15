import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        // dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        // dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date
    }
}
