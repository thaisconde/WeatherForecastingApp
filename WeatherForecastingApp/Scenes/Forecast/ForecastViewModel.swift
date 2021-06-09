protocol ForecastViewModelProtocol {
    func fetchForecast(place: String)
    var delegate: ForecastViewModelDelegate? {get set}
    var forecastByWeekday: [ForecastByWeekday] { get }
}

protocol ForecastViewModelDelegate: AnyObject {
    func updateView(with status: ViewStatus)
}

class ForecastViewModel: ForecastViewModelProtocol {
    private let service: NetworkProtocol
    weak var delegate: ForecastViewModelDelegate?
    
    var forecastByWeekday: [ForecastByWeekday] = []
    
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
                self.splitDateByWeekday(with: response.list)
                self.status = .success
            case let .failure(error):
                self.status = .error(error.errorDescription)
            }
        }
    }
    
    func splitDateByWeekday(with response: [List]) {
        let splitDataInToDictionary = Dictionary(grouping: response, by: { $0.date.toWeekday})
       
        forecastByWeekday = splitDataInToDictionary.map({ (key, value) in
            return ForecastByWeekday(weekday: key, groupData: value)
        })
    }
}

//Dictionary(grouping:...) https://stackoverflow.com/questions/31220002/how-to-group-by-the-elements-of-an-array-in-swift
//Aplication: https://www.ralfebert.de/ios-examples/uikit/uitableviewcontroller/grouping-sections/
