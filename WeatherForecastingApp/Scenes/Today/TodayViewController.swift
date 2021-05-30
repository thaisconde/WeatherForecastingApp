import UIKit

private enum Layout {
}

class TodayViewController: UIViewController {
    private let place = "Praga"
    private var viewModel: TodayViewModelProtocol
    
    private enum Layout: Int {
        case separatorSize = 1
    }
    
    init(viewModel: TodayViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCurrentWeather(at: place)
    }
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("share".localized, for: .normal)
        button.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button.backgroundColor = UIColor(hex: "#FFFFFF")?.withAlphaComponent(0.3)
        button.layer.cornerRadius = 28
        button.clipsToBounds = true
        button.titleEdgeInsets = UIEdgeInsets(top: 8,
                                              left: 16,
                                              bottom: 8,
                                              right: 16)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(hex: "#EEEEEE")
        return separatorView
    }()
    
    private lazy var temperatureView = TemperatureView()
    private lazy var propertyView = WeatherPropertyView()
    private lazy var gradientView = GradientView()
    private lazy var loading = CustomLoadingView()
    
    func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    func createSubviews() {
        view.addSubview(gradientView)
        view.addSubview(propertyView)
        
        gradientView.addSubview(separatorView)
        gradientView.addSubview(temperatureView)
        gradientView.addSubview(titleLabel)
        gradientView.addSubview(shareButton)
        
    }
    
    func setupConstraints() {
        gradientView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 2/3)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(Size.big.rawValue)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(Layout.separatorSize.rawValue)
            $0.leading.trailing.equalToSuperview().inset(Size.big.rawValue)
            $0.bottom.equalToSuperview()
        }
        
        temperatureView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-Size.xlarge.rawValue)
            $0.leading.trailing.equalToSuperview().inset(Size.big.rawValue)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(temperatureView.snp.top).offset(-Size.xxlarge.rawValue)
            $0.trailing.leading.equalToSuperview().inset(Size.big.rawValue)
        }
        
        propertyView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(Size.big.rawValue)
        }
    }
}
//MARK: - DELEGATE
extension TodayViewController: TodayViewModelDelegate {
    func updateView(with status: ViewStatus) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch status {
            case .loading:
                self.view.addSubview(self.loading)
                self.loading.snp.makeConstraints {
                    $0.edges.equalToSuperview()
                }
            case .stopLoading:
                self.loading.removeFromSuperview()
            case let .error(error):
                print(error)
            case .success:
                self.setupView()
            default:
                break
            }
        }
    }
}
