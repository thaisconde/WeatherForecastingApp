import UIKit

class ForecastHeaderSection: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
            $0.top.bottom.leading.equalToSuperview()
            $0.trailing.greaterThanOrEqualTo(dateLabel).offset(-8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
        }
    }
}
