import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)

        return date
    }
    
    var toWeekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else { return String() }
        
        let weekDayId = Calendar.current.component(.weekday, from: date)
        let weekDayDescription = Calendar.current.weekdaySymbols[weekDayId - 1]
        
        return weekDayDescription
    }
    
    var toSectionDescription: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else { return String() }
        
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "EEEE, dd MMM"
        return dateFormatterString.string(from: date)
    }
}
