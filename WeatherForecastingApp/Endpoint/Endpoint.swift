enum Endpoint {
    case currentWeather(String)
    
    var value: String {
        if case let .currentWeather(place) = self {
            return
            "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=58fc3b37673e227b20819f4bcf0c71f6"
        }
        return String()
    }
}
