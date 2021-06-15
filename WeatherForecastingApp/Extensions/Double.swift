import Foundation

extension Double {
    var stringCelsius: String {
         String(format: "%.0f", self) + "°C"
    }
    
    var msTokmh: String {
        String(format: "%.2f", self * 3.6) + "KM/H"
    }
    
    var windSimbol: String {
        var simbol: String
        let proportion: Double = 11.25
        // let double = rounded(self*100) / 100.0
        
        switch self {
        case 31 * proportion..<proportion:
            simbol = "N"
        case proportion..<3 * proportion:
            simbol = "NNE"
        case 3 * proportion..<5 * proportion:
            simbol = "NE"
        case 5 * proportion..<7 * proportion:
            simbol = "ENE"
        case 7 * proportion..<9 * proportion:
            simbol = "E"
        case 9 * proportion..<11 * proportion:
            simbol = "ESE"
        case 11 * proportion..<13 * proportion:
            simbol = "SE"
        case 13 * proportion..<15 * proportion:
            simbol = "SSE"
        case 15 * proportion..<17 * proportion:
            simbol = "S"
        case 17 * proportion..<19 * proportion:
            simbol = "SSW"
        case 19 * proportion..<21 * proportion:
            simbol = "SW"
        case 21 * proportion..<23 * proportion:
            simbol = "WSW"
        case 23 * proportion..<25 * proportion:
            simbol = "W"
        case 25 * proportion..<27 * proportion:
            simbol = "WNW"
        case 27 * proportion..<29 * proportion:
            simbol = "NW"
        case 29 * proportion..<31 * proportion:
            simbol = "NNW"
        default:
            simbol = ""
        }
        return simbol
        // ref: https://meteoropole.com.br/2014/01/vento-conversao-da-direcao/
    }
}
