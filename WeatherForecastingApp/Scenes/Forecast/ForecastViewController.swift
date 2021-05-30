import UIKit

class ForecastViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureView()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TESTasdfsdfsdfsadfsd"
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var cell = CellView()
   
    func configureView() {
        //view.addSubview(label)
        view.addSubview(cell)
        
        cell.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(70)
        }
        
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        ])
    }
}
