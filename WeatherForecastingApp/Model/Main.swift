struct Main: Decodable {
    let temp: Double?
    let pressure: Double?
    let humidity: Int?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
