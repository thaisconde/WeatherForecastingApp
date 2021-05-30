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
    var currentWeather: [CurrentWeatherResponse] { get set }
}

protocol TodayViewModelDelegate: AnyObject {
    func updateView(with status: ViewStatus)
}

class TodayViewModel: TodayViewModelProtocol {
    private let network: NetworkProtocol
    weak var delegate: TodayViewModelDelegate?
    var currentWeather: [CurrentWeatherResponse] = []
    
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
                self?.status = .error(error.localizedDescription)
                print(error)
            case let .success(response):
                self?.currentWeather = response
                self?.status = .success
            }
        }
    }
    
//    func properties() -> [String] {
//        for i in currentWeather {
//            let humidity = "\(i.main.humidity ?? "")"
//            let precipitation = "\(i.ma)"
//            return [humidity,]
//        }
//        
//    }
}
