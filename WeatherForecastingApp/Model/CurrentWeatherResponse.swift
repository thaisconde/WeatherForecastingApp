struct CurrentWeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let id: Int
    let name: String
    let cod: Int
    let wind: Wind
}
