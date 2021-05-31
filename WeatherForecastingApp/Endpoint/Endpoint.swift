enum Endpoint {
    case currentWeather(String)
    case forecastWeather(String)
    
    var value: String {
        switch self {
        case let .currentWeather(place):
            return "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=58fc3b37673e227b20819f4bcf0c71f6&units=metric"
        case let .forecastWeather(place):
            return "https://api.openweathermap.org/data/2.5/forecast?q=\(place)&appid=58fc3b37673e227b20819f4bcf0c71f6&units=metric"
        }
    }
}
