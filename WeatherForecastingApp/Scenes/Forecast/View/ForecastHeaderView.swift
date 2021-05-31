import UIKit

class ForecastHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    private func commonInit() {
        setupView()
    }
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "TODAY"
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Date())"
        return label
    }()
    
    private func createSubviews() {
        addSubview(dayLabel)
        addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        dayLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(Size.medium.rawValue)
            $0.trailing.greaterThanOrEqualTo(dateLabel).offset(-Size.small.rawValue)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Size.small.rawValue)
            $0.top.bottom.centerX.centerY.equalTo(dayLabel)
        }
    }
}
