import UIKit

class TemperatureView: UIView {
    private enum Layout: Int {
        case imageSize = 40
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
        
    lazy var forecastImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.Style(.headline3)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.Style(.contentRegular)
        label.textColor = UIColor(hex: "#949494")
        return label
    }()
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private func createSubviews() {
        addSubview(forecastImageView)
        addSubview(temperatureLabel)
        addSubview(locationLabel)
    }
    
    private func setupConstraints() {
        forecastImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(Layout.imageSize.rawValue)
        }

        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(forecastImageView.snp.bottom).offset(Size.xsmall.rawValue)
            $0.leading.trailing.equalToSuperview()
        }

        locationLabel.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(Size.small.rawValue)
        }
    }
}
