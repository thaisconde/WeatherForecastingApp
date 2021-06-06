import UIKit

extension UIFont {
    public enum StyleFont {
        case headline1
        case headline2
        case headline3
        case headline4
        case buttons
        case tabBar
        case contentRegular
        case contentMedium
        case contentSmall
    }

    static func style(_ type: StyleFont) -> UIFont {
        var font: UIFont
        switch type {
        case .headline1:
            font = UIFont(name: "Inter-Bold", size: 64) ?? UIFont.systemFont(ofSize: 64)
        case .headline2:
            font = UIFont(name: "Inter-Bold", size: 40) ?? UIFont.systemFont(ofSize: 40)
        case .headline3:
            font = UIFont(name: "Inter-SemiBold", size: 32) ?? UIFont.systemFont(ofSize: 32)
        case .headline4:
            font = UIFont(name: "Inter-SemiBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        case .buttons:
            font = UIFont(name: "Inter-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        case .tabBar:
            font = UIFont(name: "Inter-SemiBold", size: 10) ?? UIFont.systemFont(ofSize: 10)
        case .contentRegular:
            font = UIFont(name: "Inter-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        case .contentMedium:
            font = UIFont(name: "Inter-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
        case .contentSmall:
            font = UIFont(name: "Inter-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
        }
        return font
    }

//    var isBold: Bool {
//        return fontDescriptor.symbolicTraits.contains(.traitBold)
//    }
//
//    var isItalic: Bool {
//        return fontDescriptor.symbolicTraits.contains(.traitItalic)
//    }

    // tutorial FONT: https://medium.com/@AttiaMo/custom-fonts-in-ios-apps-global-settings-and-localizations-e6193918e35c
}
