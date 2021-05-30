import Foundation
import UIKit

class GradientView: UIView {
    let componentsColor: [CGFloat] = [ 0, 0, 0, 0.9, 0, 0, 0, 0]
    let locations: [CGFloat] = [0, 1]
    let colorQyt: Int = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.comomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.comomInit()
    }
    
    func comomInit(){
        self.backgroundColor = UIColor.clear
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func draw(_ rect: CGRect) {
        guard let gradient = customizeEffect() else { return }
        //effectMiddleDown(gradient: gradient)
        //effectMiddleUp(gradient: gradient)
        singleEffect(gradient: gradient)
    }
    
    private func customizeEffect() -> CGGradient? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let gradient = CGGradient(colorSpace: colorSpace,
                                        colorComponents: componentsColor,
                                        locations: locations,
                                        count: colorQyt) else {return nil}
        return gradient
    }
    
    private func singleEffect(gradient: CGGradient){
        let context = UIGraphicsGetCurrentContext()
        let startCenter = CGPoint(x: bounds.width, y: 0)
        let startRadius: CGFloat = 120
        let endCenter = CGPoint(x: bounds.width/4, y: bounds.height/4)
        let endRadius: CGFloat = bounds.height
       
        context?.drawRadialGradient(gradient,
                                    startCenter: startCenter,
                                    startRadius: startRadius,
                                    endCenter: endCenter,
                                    endRadius: endRadius,
                                    options: .drawsAfterEndLocation)
        
//        let startPoint = CGPoint(x: 0, y: bounds.height)
//        let endPoint = CGPoint(x: bounds.width, y: 0)
//        context?.drawLinearGradient(gradient,
//                                    start: startPoint,
//                                    end: endPoint,
//                                    options: .drawsAfterEndLocation)
    }
    
    private func effectMiddleDown(gradient: CGGradient){
        let context = UIGraphicsGetCurrentContext()
        let startPoint = CGPoint(x: 0, y: bounds.midY)
        let endPoint = CGPoint(x: 0, y: bounds.height)
        context?.drawLinearGradient(gradient,
                                    start: startPoint ,
                                    end:  endPoint ,
                                    options: .drawsAfterEndLocation)
    }
    
    private func effectMiddleUp(gradient: CGGradient){
        let context = UIGraphicsGetCurrentContext()
        let startPoint = CGPoint(x: 0, y: bounds.midY)
        let endPoint =  CGPoint.zero
        context?.drawLinearGradient(gradient,
                                    start: startPoint ,
                                    end:  endPoint ,
                                    options: .drawsAfterEndLocation)
    }
}
