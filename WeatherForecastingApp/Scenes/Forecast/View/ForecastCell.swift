import UIKit

class ForecastCell: UITableViewCell {
    private enum Layout: CGFloat {
        case contentIconSize = 48
        case contentIconRadius = 24
        case imageSize = 28.8
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
        selectionStyle = .none
    }
    
//MARK: - VIEW
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(Size.medium.rawValue)
        view.clipsToBounds = true
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    private lazy var contentIconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Layout.contentIconRadius.rawValue
        view.clipsToBounds = true
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil.circle")
        return imageView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.style(.contentMedium)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.style(.contentSmall)
        label.textColor = UIColor(hex: "#949494")
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = UIFont.style(.headline3)
        return label
    }()
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private func createSubviews() {
        addSubview(wrapperView)
        
        wrapperView.addSubview(contentIconView)
        wrapperView.addSubview(timeLabel)
        wrapperView.addSubview(descriptionLabel)
        wrapperView.addSubview(temperatureLabel)
        
        contentIconView.addSubview(iconImageView)
    }
    
    private func setupConstraints() {
        wrapperView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(Size.big.rawValue)
            $0.bottom.equalToSuperview().inset(Size.small.rawValue)
        }
        
        contentIconView.snp.makeConstraints {
            $0.size.equalTo(Layout.contentIconSize.rawValue)
            $0.leading.equalToSuperview().inset(Size.medium.rawValue)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Layout.imageSize.rawValue)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Size.medium.rawValue)
            $0.leading.equalTo(contentIconView.snp.trailing).offset(Size.medium.rawValue)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom)
            $0.bottom.equalToSuperview().offset(-Size.medium.rawValue)
            $0.leading.equalTo(contentIconView.snp.trailing).offset(Size.medium.rawValue)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(Size.medium.rawValue)
        }
    }
}
extension ForecastCell {
    func setupCell(weatherList: List) {
        guard let itemWeather = weatherList.weather.first else { return }
        iconImageView.image = UIImage(named: itemWeather.icon.forecastIcon)
        descriptionLabel.text = itemWeather.icon.title
        temperatureLabel.text = weatherList.main.temp?.stringCelsius
        timeLabel.text = weatherList.date.toHour
        
        let currentTime = Date().timeIntervalSinceReferenceDate
    }
}

extension ForecastCell {
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
