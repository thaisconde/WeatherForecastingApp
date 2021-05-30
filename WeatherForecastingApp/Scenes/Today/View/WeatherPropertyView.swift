import UIKit

class WeatherPropertyView: UIView {
    private enum Layout: Int {
        case imageSize = 24
        case wraperImageSize = 40
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
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(Layout.wraperImageSize.rawValue / 2)
        view.clipsToBounds = true
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil.circle")
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat(Size.small.rawValue)
        return stackView
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "19ºC"
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Prague, Czech Republic"
        return label
    }()
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private func createSubviews() {
        addSubview(stackView)
        addSubview(wrapperView)
        
        stackView.addArrangedSubview(wrapperView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(nameLabel)
        
        wrapperView.addSubview(iconImageView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        wrapperView.snp.makeConstraints {
            $0.size.equalTo(Layout.wraperImageSize.rawValue)
        }
        
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Layout.imageSize.rawValue)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(valueLabel.snp.bottom).offset(Size.xsmall.rawValue).priority(.required)
        }
    }
}
