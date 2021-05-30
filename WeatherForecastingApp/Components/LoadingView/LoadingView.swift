import UIKit

class CustomLoadingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        view.layer.cornerRadius = CGFloat(Size.medium.rawValue)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var activeIndicator: UIActivityIndicatorView = {
        let activeIndicator = UIActivityIndicatorView()
        activeIndicator.startAnimating()
        activeIndicator.style = .medium
        return activeIndicator
    }()
    
    private func createSubviews() {
        addSubview(contentView)
        contentView.addSubview(activeIndicator)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Size.xxxlarge.rawValue)
        }
        
        activeIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
