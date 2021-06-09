import UIKit

class ForecastViewController: UIViewController {
    private var viewModel: ForecastViewModelProtocol
    private let place = "Praga"
    
    init(viewModel: ForecastViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchForecast(place: place)
        configureView()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Forecast"
        label.font = UIFont.style(.headline2)
        return label
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        //tableView.rowHeight = 120
        tableView.register(ForecastCell.self,
                           forCellReuseIdentifier: String(describing: ForecastCell.self))
        tableView.register(ForecastHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: String(describing: ForecastHeaderView.self))
        //tableView.backgroundView = activity
        //tableView.tableHeaderView = UIView()
        //tableView.tableFooterView = UIView()
        return tableView
    }()
    
   
    func configureView() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(Size.big.rawValue)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Size.big.rawValue)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension ForecastViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.forecastByWeekday.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastByWeekday[section].groupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ForecastCell.self), for: indexPath) as? ForecastCell else {
            return UITableViewCell() }

        let weatherList = viewModel.forecastByWeekday[indexPath.section].groupData[indexPath.row]
        
        cell.setupCell(weatherList: weatherList)
        
        return cell
    }
}

extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ForecastHeaderView.self)) as? ForecastHeaderView else {return UIView()}
        
        let data = viewModel.forecastByWeekday[section].weekday
        view.setupData(with: data)
        
        return view
    }
}

extension ForecastViewController: ForecastViewModelDelegate {
    func updateView(with status: ViewStatus) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch status {
            case .success:
                self.tableView.reloadData()
            default:
                break
            }
        }
    }
}
