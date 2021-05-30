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
    var currentWeather: [CurrentWeatherResponse]? { get set }
}

protocol TodayViewModelDelegate: AnyObject {
//    func showError(message: String)
   // func updateView(data: [CurrentWeatherResponse])
    func updateView(with status: ViewStatus)
}

class TodayViewModel: TodayViewModelProtocol {
    private let network: NetworkProtocol
    weak var delegate: TodayViewModelDelegate?
    var currentWeather: [CurrentWeatherResponse]?
    
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
        network.request(url: .currentWeather(place)) { [weak self] result in
            self?.status = .stopLoading
            switch result {
            case let .failure(error):
                self?.status = .error(error.localizedDescription)
                print(error)
            case let .success(response):
                self?.currentWeather = response
                self?.status = .success
            }
        }
    }
}
