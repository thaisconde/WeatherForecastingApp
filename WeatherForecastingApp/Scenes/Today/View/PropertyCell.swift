import UIKit

extension PropertyCell.Layout {
    enum Size {
        static let image: Int = 24
        static let wraperImage: Int = 40
        static let cornerRadius: CGFloat = CGFloat(wraperImage / 2)
    }
}

final class PropertyCell: UICollectionViewCell {
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
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Layout.Size.cornerRadius
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
    func setupCell(with property: Weather) {
        iconImageView.image = UIImage(named: property.icon.todayIcon)
    }
}
