struct Weather: Decodable, Equatable {
    let id: Int
    let description: String
    let icon: Icon
}
