import Foundation

extension Date {
    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        
        return str
    }
}

public extension Date {
    /// "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static var firstFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }
    
    /// "yyyy/MM/dd"
    static var secondFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }
    
    /// "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static var thirdFormatter: DateFormatter {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .iso8601)
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return df
    }
    
    /// "dd/MM/yyyy"
    static var forthFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }
    
    /// "yyyy-MM-dd"
    static var fifthFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }
    
    /// "HH:mm'"
    static var sixthFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }
    
    /// "HH:mm'"
    static var seventhFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }
    
    static var decodableFormatter: DateFormatter {
        DecodableDateFormatter()
    }
}

public final class DecodableDateFormatter: DateFormatter {
    override public func date(from string: String) -> Date? {
        let formatters: [DateFormatter] = [
            Date.firstFormatter,
            Date.secondFormatter,
            Date.thirdFormatter,
            Date.forthFormatter,
            Date.fifthFormatter
        ]
        
        for formatter in formatters {
            guard let date = formatter.date(from: string) else {
                continue
            }
            return date
        }
        
        return nil
    }
}
