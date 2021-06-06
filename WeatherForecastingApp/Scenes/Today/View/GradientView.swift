import Foundation
import UIKit

class GradientView: UIView {
    private let innerColorBlue = UIColor(hex: "3861F0")?.cgColor
    private let middleColorBlue = UIColor(hex: "8DD0F6")?.cgColor
    private let endColorBlue = UIColor(hex: "FFFFFF")?.withAlphaComponent(0.53).cgColor
    
    private let innerColorYellow = UIColor(hex: "#FCBA56")?.cgColor
    private let middleColorYellow  = UIColor(hex: "#FCEC98")?.cgColor
    private let endColorYellow = UIColor(hex: "#FFFFFF")?.cgColor
    
    private var colorToApply: [CGColor?] = []
    private let starPoint = CGPoint(x: 1, y: 0)
    private let endPoint = CGPoint(x: 0, y: 1)
    private let location: [NSNumber] = [0.0, 0.4, 0.6]
    
    required init(isItRaining: Bool) {
        colorToApply = isItRaining
            ? [innerColorBlue, middleColorBlue, endColorBlue]
            : [innerColorYellow, middleColorYellow, endColorYellow]
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorToApply as [Any]
        gradientLayer.startPoint = starPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.type = .axial
        gradientLayer.locations = location
        gradientLayer.frame = self.bounds
        //gradientLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/45, 0, 0, 1)
        //gradientLayer.cornerRadius = bounds.width / 2
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
