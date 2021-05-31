struct ForecastWeatherResponse: Decodable {
    let date: String?
    let main: [Main]
    let weather: [Weather]
    
    enum codingKey: String, CodingKey {
        case date = "dt_txt"
    }
}

