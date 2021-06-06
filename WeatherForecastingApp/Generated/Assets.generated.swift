// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Forecast {
    internal static let todayBrokenCloudsDark = ImageAsset(name: "TodayBrokenClouds-Dark")
    internal static let todayBrokenCloudsLight = ImageAsset(name: "TodayBrokenClouds-Light")
    internal static let todayCloudyDark = ImageAsset(name: "TodayCloudy-Dark")
    internal static let todayCloudyLight = ImageAsset(name: "TodayCloudy-Light")
    internal static let todayFewCloudsMoonDark = ImageAsset(name: "TodayFewCloudsMoon-Dark")
    internal static let todayFewCloudsMoonLight = ImageAsset(name: "TodayFewCloudsMoon-Light")
    internal static let todayFewCloudsSunDark = ImageAsset(name: "TodayFewCloudsSun-Dark")
    internal static let todayFewCloudsSunLight = ImageAsset(name: "TodayFewCloudsSun-Light")
    internal static let todayMistDark = ImageAsset(name: "TodayMist-Dark")
    internal static let todayMistLight = ImageAsset(name: "TodayMist-Light")
    internal static let todayMoonDark = ImageAsset(name: "TodayMoon-Dark")
    internal static let todayMoonLight = ImageAsset(name: "TodayMoon-Light")
    internal static let todayRainDark = ImageAsset(name: "TodayRain-Dark")
    internal static let todayRainLight = ImageAsset(name: "TodayRain-Light")
    internal static let todayShowersDark = ImageAsset(name: "TodayShowers-Dark")
    internal static let todayShowersLight = ImageAsset(name: "TodayShowers-Light")
    internal static let todaySnowDark = ImageAsset(name: "TodaySnow-Dark")
    internal static let todaySnowLight = ImageAsset(name: "TodaySnow-Light")
    internal static let todaySunDark = ImageAsset(name: "TodaySun-Dark")
    internal static let todaySunLight = ImageAsset(name: "TodaySun-Light")
    internal static let todayThunderstormDark = ImageAsset(name: "TodayThunderstorm-Dark")
    internal static let todayThunderstormLight = ImageAsset(name: "TodayThunderstorm-Light")
  }
  internal enum Others {
    internal static let emoticonSad = ImageAsset(name: "emoticon-sad")
    internal static let placeholderImage = ImageAsset(name: "placeholder_image")
    internal static let user = ImageAsset(name: "user")
  }
  internal enum Properties {
    internal enum Temperature {
      internal static let forecastBrokenCloudsDark = ImageAsset(name: "ForecastBrokenClouds-Dark")
      internal static let forecastBrokenCloudsLight = ImageAsset(name: "ForecastBrokenClouds-Light")
      internal static let forecastCloudyDark = ImageAsset(name: "ForecastCloudy-Dark")
      internal static let forecastCloudyLight = ImageAsset(name: "ForecastCloudy-Light")
      internal static let forecastFewCloudsMoonDark = ImageAsset(name: "ForecastFewCloudsMoon-Dark")
      internal static let forecastFewCloudsMoonLight = ImageAsset(name: "ForecastFewCloudsMoon-Light")
      internal static let forecastFewCloudsSunDark = ImageAsset(name: "ForecastFewCloudsSun-Dark")
      internal static let forecastFewCloudsSunLight = ImageAsset(name: "ForecastFewCloudsSun-Light")
      internal static let forecastMistDark = ImageAsset(name: "ForecastMist-Dark")
      internal static let forecastMistLight = ImageAsset(name: "ForecastMist-Light")
      internal static let forecastMoonDark = ImageAsset(name: "ForecastMoon-Dark")
      internal static let forecastMoonLight = ImageAsset(name: "ForecastMoon-Light")
      internal static let forecastRainDark = ImageAsset(name: "ForecastRain-Dark")
      internal static let forecastRainLight = ImageAsset(name: "ForecastRain-Light")
      internal static let forecastShowersDark = ImageAsset(name: "ForecastShowers-Dark")
      internal static let forecastShowersLight = ImageAsset(name: "ForecastShowers-Light")
      internal static let forecastSnowDark = ImageAsset(name: "ForecastSnow-Dark")
      internal static let forecastSnowLight = ImageAsset(name: "ForecastSnow-Light")
      internal static let forecastSunDark = ImageAsset(name: "ForecastSun-Dark")
      internal static let forecastSunLight = ImageAsset(name: "ForecastSun-Light")
      internal static let forecastThunderstormDark = ImageAsset(name: "ForecastThunderstorm-Dark")
      internal static let forecastThunderstormLight = ImageAsset(name: "ForecastThunderstorm-Light")
    }
    internal static let todayHumidityDark = ImageAsset(name: "TodayHumidity-Dark")
    internal static let todayHumidityLight = ImageAsset(name: "TodayHumidity-Light")
    internal static let todayPrecipitationDark = ImageAsset(name: "TodayPrecipitation-Dark")
    internal static let todayPrecipitationLight = ImageAsset(name: "TodayPrecipitation-Light")
    internal static let todayPressureDark = ImageAsset(name: "TodayPressure-Dark")
    internal static let todayPressureLight = ImageAsset(name: "TodayPressure-Light")
    internal static let todayWindDirectionDark = ImageAsset(name: "TodayWindDirection-Dark")
    internal static let todayWindDirectionLight = ImageAsset(name: "TodayWindDirection-Light")
    internal static let todayWindSpeedDark = ImageAsset(name: "TodayWindSpeed-Dark")
    internal static let todayWindSpeedLight = ImageAsset(name: "TodayWindSpeed-Light")
  }
  internal enum TabBar {
    internal static let tabBarForecastDark = ImageAsset(name: "TabBarForecast-Dark")
    internal static let tabBarForecastLight = ImageAsset(name: "TabBarForecast-Light")
    internal static let tabBarTodayDark = ImageAsset(name: "TabBarToday-Dark")
    internal static let tabBarTodayLight = ImageAsset(name: "TabBarToday-Light")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
