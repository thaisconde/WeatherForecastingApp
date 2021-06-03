struct ForecastWeatherResponse: Decodable {
    let list: [List]
    let city: City
}

struct City: Decodable {
    let name: String
    let country: String
}

struct List: Decodable {
    let date: String?
    let main: Main
    let weather: [Weather]

    enum codingKey: String, CodingKey {
        case date = "dt_txt"
    }
}
