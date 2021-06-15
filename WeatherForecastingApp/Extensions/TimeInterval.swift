import Foundation

extension TimeInterval {
    //    var toDate: Date {
    //        let date = Date(timeIntervalSince1970: self)
    //        let components = Calendar.current.component(.weekday , from: date)
    //        components.
    //        return date
    //    }
    
    // 03:00 PM
    var toHour: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: date)
    }
    
    // Tuesday
    var toWeekday: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    // Tuesday, 08 Jun
    var firstFormatter: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM"
        return dateFormatter.string(from: date)
    }
}
