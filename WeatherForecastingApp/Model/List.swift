import Foundation

struct List: Decodable, Equatable {
    let date: TimeInterval //https://stackoverflow.com/questions/40648284/using-dateformatter-on-a-unix-timestamp
    let main: Main
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case main, weather
        case date = "dt"
    }
}
