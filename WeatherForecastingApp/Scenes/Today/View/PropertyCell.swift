import UIKit

extension PropertyCell.Layout {
    enum Size {
        static let image: Int = 24
        static let wraperImage: Int = 40
        static let cornerRadius: CGFloat = CGFloat(wraperImage / 2)
    }
}

final class PropertyCell: UICollectionViewCell {
    
    private let property = ["Humidity", "Precipitation", "Pressure", "Wind", "Direction"]
    private let iconString = ["TodayHumidity-Light",
                              "TodayPrecipitation-Light",
                              "TodayPressure-Light",
                              "TodayWindDirection-Light",
                              "TodayWindSpeed-Light"]
    
    fileprivate enum Layout {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupView()
    }
    
//MARK: - LAYOUT
    private lazy var wrapperImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Layout.Size.cornerRadius
        view.clipsToBounds = true
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = CGFloat(Size.small.rawValue)
        return stackView
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.style(.contentSmall)
        //label.numberOfLines = 0
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.style(.contentSmall)
        label.textColor = UIColor(hex: "#949494")
        //label.numberOfLines = 0
        return label
    }()
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private func createSubviews() {
        addSubview(stackView)
        addSubview(wrapperImageView)
        
        stackView.addArrangedSubview(wrapperImageView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(nameLabel)
        
        wrapperImageView.addSubview(iconImageView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        wrapperImageView.snp.makeConstraints {
            $0.size.equalTo(Layout.Size.wraperImage)
        }
        
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Layout.Size.image)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(valueLabel.snp.bottom).offset(Size.xsmall.rawValue).priority(.required)
        }
    }
}

extension PropertyCell {
    func setupCell(currentWeather: CurrentWeatherResponse, indexPath: IndexPath) {
        guard indexPath.contains(indexPath.row) else { return }
        iconImageView.image = UIImage(named: iconString[indexPath.row])
        valueLabel.text = "56%"
        nameLabel.text = property[indexPath.row]
        
        switch indexPath.row {
        case 0:
            valueLabel.text = String(currentWeather.main.humidity ?? 0)+"%"
        case 1:
            valueLabel.text = "1.0MM"
        case 2:
            valueLabel.text = String(currentWeather.main.pressure ?? 0)+"hPa"
        case 3:
            valueLabel.text = currentWeather.wind.speed.msTokmh
        case 4:
            valueLabel.text = String(currentWeather.wind.deg) //currentWeather.wind.deg.windSimbol
        default:
            break
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        iconImageView.image = nil
        valueLabel.text = nil
    }
}
