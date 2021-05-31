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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "TESTasdfsdfsdfsadfsd"
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 50)
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
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ForecastViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ForecastCell.self), for: indexPath) as? ForecastCell else {
            return UITableViewCell() }
        
        return cell
    }
}

extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ForecastHeaderView.self)) as? ForecastHeaderView
        
        return view
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}

extension ForecastViewController: ForecastViewModelDelegate {
    func updateView(with status: ViewStatus) {
        print(status)
    }
}
