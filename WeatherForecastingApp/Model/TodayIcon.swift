import UIKit

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
    
    var forecastIcon: UIImage {
        switch self {
        case .clearSkyDay:
            return Assets.Forecast.todaySun.image
        case .clearSkyNight:
            return Assets.Forecast.todayMoon.image
        case .fewCloudsDay:
            return Assets.Forecast.todayFewCloudsSun.image
        case .fewCloudsNight:
            return Assets.Forecast.todayFewCloudsMoon.image
        case .scatteredCloudsDay, .scatteredCloudsNight:
            return Assets.Forecast.todayCloudy.image
        case .brokenCloudsDay, .brokenCloudsNight:
            return Assets.Forecast.todayBrokenClouds.image
        case .showerRainDay, .showerRainNight:
            return Assets.Forecast.todayShowers.image
        case .rainDay, .rainNight:
            return Assets.Forecast.todayRain.image
        case .thunderstormDay, .thunderstormNight:
            return Assets.Forecast.todayThunderstorm.image
        case .snowDay, .snowNight:
            return Assets.Forecast.todaySnow.image
        case .mistDay, .mistNight:
            return Assets.Forecast.todayMist.image
        }
    }
    
    var todayIcon: UIImage {
        switch self {
        case .clearSkyDay:
            return Assets.Properties.Temperature.forecastSun.image
        case .clearSkyNight:
            return Assets.Properties.Temperature.forecastMoon.image
        case .fewCloudsDay:
            return Assets.Properties.Temperature.forecastFewCloudsSun.image
        case .fewCloudsNight:
            return Assets.Properties.Temperature.forecastFewCloudsMoon.image
        case .scatteredCloudsDay, .scatteredCloudsNight:
            return Assets.Properties.Temperature.forecastCloudy.image
        case .brokenCloudsDay, .brokenCloudsNight:
            return Assets.Properties.Temperature.forecastBrokenClouds.image
        case .showerRainDay, .showerRainNight:
            return Assets.Properties.Temperature.forecastShowers.image
        case .rainDay, .rainNight:
            return Assets.Properties.Temperature.forecastRain.image
        case .thunderstormDay, .thunderstormNight:
            return Assets.Properties.Temperature.forecastThunderstorm.image
        case .snowDay, .snowNight:
            return Assets.Properties.Temperature.forecastSnow.image
        case .mistDay, .mistNight:
            return Assets.Properties.Temperature.forecastMist.image
        }
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
