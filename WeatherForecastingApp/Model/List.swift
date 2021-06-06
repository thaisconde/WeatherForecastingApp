import Foundation

struct List: Decodable {
    let date: Date?
    let main: Main
    let weather: [Weather]

    enum codingKey: String, CodingKey {
        case main, weather
        case date = "dt"
    }
}
