import UIKit

private enum Layout {
}

final class TodayViewController: UIViewController {
    private let place = "Praga"
    private var viewModel: TodayViewModelProtocol
    
    lazy var tabBarHeight: CGFloat = {
        return self.tabBarController?.tabBar.frame.size.height ?? 0
    }()
    
    lazy var screenHeight: CGFloat = {
        return UIScreen.main.bounds.size.height
    }()
    
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
//
//    override func loadView() {
//        super.loadView()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCurrentWeather(at: place)
    }
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("share".localized, for: .normal)
        button.titleLabel?.font = UIFont.Style(.buttons)
        button.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button.backgroundColor = UIColor(hex: "#FFFFFF")?.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleEdgeInsets = UIEdgeInsets(top: 8,
                                              left: 16,
                                              bottom: 8,
                                              right: 16)
        button.addTarget(self, action: #selector(shareButtonTapped) , for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.Style(.headline1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(hex: "#EEEEEE")
        return separatorView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.estimatedItemSize = CGSize(width: 96, height: 104)
        //UICollectionViewFlowLayout.automaticSize
            //CGSize(width: (UIScreen.main.bounds.width - 48) / 3, height: UIScreen.main.bounds.height / 2)
            
        //layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PropertyCell.self,
                                forCellWithReuseIdentifier: String(describing: PropertyCell.self))
        return collectionView
    }()
    
    private lazy var temperatureView = TemperatureView()
    //private lazy var propertyView = WeatherPropertyView()
    private lazy var gradientView = GradientView(isItRaining: false)
    private lazy var loading = CustomLoadingView()
    
    func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    func createSubviews() {
        view.addSubview(gradientView)
        view.addSubview(collectionView)
        
        gradientView.addSubview(separatorView)
        gradientView.addSubview(temperatureView)
        gradientView.addSubview(titleLabel)
        gradientView.addSubview(shareButton)
        
 
    }
    
    func setupConstraints() {
        gradientView.snp.makeConstraints {
            //let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.size.height
//            let statusBarHeight = UIApplication.shared.statusBarFrame.height
//            let topSafeArea = view.safeAreaInsets.top
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo((screenHeight - tabBarHeight) * 2/3)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.trailing.equalToSuperview().offset(-Size.big.rawValue)
            $0.width.equalTo(77)
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(Size.medium.rawValue)
            $0.leading.trailing.equalToSuperview().inset(Size.big.rawValue)
            $0.bottom.equalTo(tabBarHeight).offset(-Size.medium.rawValue)
            
            //view.safeAreaLayoutGuide
        }
    }
}
//MARK: - COLLECTION VIEW METHODS

extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PropertyCell.self), for: indexPath) as? PropertyCell else { return UICollectionViewCell()}
        
        guard let main = viewModel.currentWeather else { return UICollectionViewCell() }
        cell.setupCell(currentWeather: main,  indexPath: indexPath)
        return cell
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

//        let screenWidth = UIScreen.main.bounds.width
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PropertyCell.self), for: IndexPath(row: 0, section: section)) as? PropertyCell else { return 0.0}
//
//        let cellSize = cell.contentView.frame.size.width
//
//        return (screenWidth - 3 * cellSize - 48 ) / 2
        
        //CGSize(width: (UIScreen.main.bounds.width - 48) / 3, height: UIScreen.main.bounds.height / 2)
        
        //return (UIScreen.main.bounds.width - 48 - 3*96 ) / 2
        return 60
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
                self.updateView()
                self.setupView()
                self.collectionView.reloadData()
            default:
                break
            }
        }
    }
    
    func updateView() {
        guard let icon = viewModel.currentWeather?.weather.first?.icon else { return }
        temperatureView.forecastImageView.image = UIImage(named: icon.todayIcon)
        temperatureView.temperatureLabel.text = viewModel.currentWeather?.main.temp?.stringCelsius
        temperatureView.locationLabel.text = viewModel.currentWeather?.name
        
        titleLabel.text = icon.title
    }
}

private extension TodayViewController {
    @objc
    func shareButtonTapped() {
        let item = "Location: \(String(describing: viewModel.currentWeather!.name))"
        let activityController = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = view
        present(activityController, animated: true)
    }
}
