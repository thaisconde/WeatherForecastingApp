import UIKit
import SnapKit

class CustomErrorView {
    private let imageName = "emoticon-sad"
    private var message: String?
    private var firstAction: (()->())?
    private var secondAction: (()->())?
    
    init(message: String, firstAction: @escaping () -> Void , secondAction: @escaping () -> Void) {
        self.message = message
        self.firstAction = firstAction
        self.secondAction = secondAction
        setupView()
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "errorView.title".localized
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var feedbackMessageLabel: UILabel = {
        let label = UILabel()
        label.text = message
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("errorView.firstOptionButton".localized, for: .normal)
        button.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(firstButtonTapped)))
        return button
    }()
    
    private func setupView() {
        createSubviews()
        setupConstraints()
    }
    
    private func createSubviews() {
       // addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(feedbackMessageLabel)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(180)
            $0.trailing.leading.equalToSuperview()
        }
    }
}
@objc
private extension CustomErrorView {
    func firstButtonTapped() {
        guard firstAction != nil else { return }
    }
}

