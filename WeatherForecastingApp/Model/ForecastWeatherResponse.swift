struct ForecastWeatherResponse: Decodable {
    let list: [List]
    let city: City
}
