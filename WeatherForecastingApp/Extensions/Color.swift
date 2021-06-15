import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        if #available(iOS 13, *) {
            // If your string is not a hex colour String then we are returning white color. you can change this to any default colour you want.
            guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal)
                else { return nil }
            
            let a, r, g, b: Int32
            switch hex.count {
            case 3:
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6:
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8:
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            
            self.init(red: CGFloat(r) / 255.0,
                      green: CGFloat(g) / 255.0,
                      blue: CGFloat(b) / 255.0,
                      alpha: CGFloat(a) / 255.0)
        } else {
            var int = UInt32()
            let a, r, g, b: UInt32
            
            Scanner(string: hex).scanHexInt32(&int)
            
            switch hex.count {
            case 3:
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6:
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8:
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            
            self.init(red: CGFloat(r) / 255.0,
                      green: CGFloat(g) / 255.0,
                      blue: CGFloat(b) / 255.0,
                      alpha: CGFloat(a) / 255.0)
        }
    }
}
