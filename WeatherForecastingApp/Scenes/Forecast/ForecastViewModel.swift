protocol ForecastViewModelProtocol {
    func fetchForecast(place: String)
    var delegate: ForecastViewModelDelegate? {get set}
    var forecast: ForecastWeatherResponse? { get }
}

protocol ForecastViewModelDelegate: AnyObject {
    func updateView(with status: ViewStatus)
}

class ForecastViewModel: ForecastViewModelProtocol {
    private let service: NetworkProtocol
    weak var delegate: ForecastViewModelDelegate?
    var forecast: ForecastWeatherResponse?
    
    init(service: NetworkProtocol) {
        self.service = service
    }
    
    private var status: ViewStatus = .none {
        didSet {
            delegate?.updateView(with: status)
        }
    }
    
    func fetchForecast(place: String) {
        status = .loading
        service.request(url: .forecastWeather(place)) { [weak self] (result: APIResponse<ForecastWeatherResponse>) in
            guard let self = self else { return }
            self.status = .stopLoading
            switch result {
            case let .success(response):
                self.status = .success
                self.forecast = response
            case let .failure(error):
                self.status = .error(error.errorDescription)
                print(error.errorDescription)
            }
        }
    }
}
