import Foundation

extension TimeInterval {
    var toWeekdayId: Int {
        let date = Date(timeIntervalSince1970: self)
        let components = Calendar.current.component(.weekday, from: date)
        return components
    }
    
    var toDateString: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    // 03:00 PM
    var toHourString: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: date)
    }
    
    // Tuesday
    var toWeekdayString: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    // Tuesday, 08 Jun
    var firstFormatterString: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM"
        return dateFormatter.string(from: date)
    }
}
