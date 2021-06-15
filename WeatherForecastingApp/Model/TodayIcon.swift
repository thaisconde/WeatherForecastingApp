enum Icon: String, Decodable {
    case clearSkyNight = "01n"
    case fewCloudsNight = "02n"
    case scatteredCloudsNight = "03n"
    case brokenCloudsNight = "04n"
    case showerRainNight = "09n"
    case rainNight = "10n"
    case thunderstormNight = "11n"
    case snowNight = "13n"
    case mistNight = "50n"
    case clearSkyDay = "01d"
    case fewCloudsDay = "02d"
    case scatteredCloudsDay = "03d"
    case brokenCloudsDay = "04d"
    case showerRainDay = "09d"
    case rainDay = "10d"
    case thunderstormDay = "11d"
    case snowDay = "13d"
    case mistDay = "50d"
    
    var forecastIcon: String {
        let prefix = "Today"
        // let sufixDark = "-Dark"
        let sufixLight = "-Light"
        var name: String
        
        switch self {
        case .clearSkyDay:
            name = "Sun"
        case .clearSkyNight:
            name = "Moon"
        case .fewCloudsDay:
            name = "FewCloudsSun"
        case .fewCloudsNight:
            name = "FewCloudsMoon"
        case .scatteredCloudsDay, .scatteredCloudsNight:
            name = "Cloudy"
        case .brokenCloudsDay, .brokenCloudsNight:
            name = "BrokenClouds"
        case .showerRainDay, .showerRainNight:
            name = "Showers"
        case .rainDay, .rainNight:
            name = "Rain"
        case .thunderstormDay, .thunderstormNight:
            name = "Thunderstorm"
        case .snowDay, .snowNight:
            name = "Snow"
        case .mistDay, .mistNight:
            name = "Mist"
        }
        
        return "\(prefix)\(name)\(sufixLight)"
    }
    
    var todayIcon: String {
        let prefix = "Forecast"
        // let sufixDark = "-Dark"
        let sufixLight = "-Light"
        var name: String
        
        switch self {
        case .clearSkyDay:
            name = "Sun"
        case .clearSkyNight:
            name = "Moon"
        case .fewCloudsDay:
            name = "FewCloudsSun"
        case .fewCloudsNight:
            name = "FewCloudsMoon"
        case .scatteredCloudsDay, .scatteredCloudsNight:
            name = "Cloudy"
        case .brokenCloudsDay, .brokenCloudsNight:
            name = "BrokenClouds"
        case .showerRainDay, .showerRainNight:
            name = "Showers"
        case .rainDay, .rainNight:
            name = "Rain"
        case .thunderstormDay, .thunderstormNight:
            name = "Thunderstorm"
        case .snowDay, .snowNight:
            name = "Snow"
        case .mistDay, .mistNight:
            name = "Mist"
        }
        
        return "\(prefix)\(name)\(sufixLight)"
    }
    
    var title: String {
        var description: String
        
        switch self {
        case .clearSkyDay:
            description = "It's hot as f***."
        case .clearSkyNight:
            description = "It's nice there."
        case .fewCloudsDay, .fewCloudsNight:
            description = "Just a few clouds."
        case .scatteredCloudsDay, .scatteredCloudsNight:
            description = "Clouds everywhere!"
        case .brokenCloudsDay, .brokenCloudsNight:
            description = "Random clouds."
        case .showerRainDay, .showerRainNight:
            description = "It's raining!"
        case .rainDay, .rainNight:
            description = "Get your umbrella."
        case .thunderstormDay, .thunderstormNight:
            description = "It's hell out there!"
        case .snowDay, .snowNight:
            description = "Winter is coming!"
        case .mistDay, .mistNight:
            description = "Can't see anything!"
        }
        return description
    }
}
