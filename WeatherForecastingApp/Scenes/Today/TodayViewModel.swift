import Foundation

enum ViewStatus {
    case loading
    case stopLoading
    case error(String)
    case none
    case success
}

protocol TodayViewModelProtocol {
    func getCurrentWeather(at place: String)
    var delegate: TodayViewModelDelegate? { get set }
    var currentWeather: CurrentWeatherResponse? { get set }
}

protocol TodayViewModelDelegate: AnyObject {
    func updateView(with status: ViewStatus)
}

class TodayViewModel: TodayViewModelProtocol {
    private let network: NetworkProtocol
    weak var delegate: TodayViewModelDelegate?
    var currentWeather: CurrentWeatherResponse?
    var properties: [String] = []
    private let property = ["Humidity",
                            "Precipitation",
                            "Pressure",
                            "Wind",
                            "Direction"]
    
    private let iconString = ["TodayHumidity-Light",
                              "TodayPrecipitation-Light",
                              "TodayPressure-Light",
                              "TodayWindDirection-Light",
                              "TodayWindSpeed-Light"]
    
    var arr: [[String: String]] = [[:]]
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    private var status: ViewStatus = .none {
        didSet {
            delegate?.updateView(with: status)
        }
    }
    
    func getCurrentWeather(at place: String) {
        status = .loading
        network.request(url: .currentWeather(place)) {[weak self] (result: APIResponse<CurrentWeatherResponse>) in

            self?.status = .stopLoading
            switch result {
            case let .failure(error):
                self?.status = .error(error.errorDescription)
            case let .success(response):
                self?.currentWeather = response
                self?.addProperties(response: response)
                self?.status = .success
            }
        }
    }
    
    func addProperties(response: CurrentWeatherResponse) {
        properties.append(String(response.main.humidity ?? 0))
        properties.append("1.0MM")
        properties.append(String(response.main.pressure ?? 0))
        properties.append(response.wind.speed.msTokmh)
        properties.append(String(response.wind.deg))
    }    
}
