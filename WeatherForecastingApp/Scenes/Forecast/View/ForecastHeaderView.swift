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
        contentView.backgroundColor = .white
    }
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.style(.headline4)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.style(.contentSmall)
        label.textColor = UIColor(hex: "#949494")
        return label
    }()
    
    private func createSubviews() {
        addSubview(dayLabel)
        addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        dayLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(Size.big.rawValue)
            $0.trailing.greaterThanOrEqualTo(dateLabel).offset(-Size.small.rawValue)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Size.big.rawValue)
            $0.centerY.equalTo(dayLabel)
        }
    }
    
    func setupData(with list: String) {
        dayLabel.text = list
       // dateLabel.text = list.date.firstFormatter
    }
}
