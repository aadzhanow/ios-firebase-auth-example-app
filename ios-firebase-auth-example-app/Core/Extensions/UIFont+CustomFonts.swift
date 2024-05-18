//
//  UIFont+CustomFonts.swift
//

import UIKit

enum CustomFonts: String {
    case poppins = "Poppins"
}

enum CustomFontStyle: String {
    case regular = "-Regular"
    case medium = "-Medium"
    case semiBold = "-SemiBold"
    case bold = "-Bold"
}

enum CustomFontSize: CGFloat {
    case s32
    case s28
    case s26
    case s24
    case s22
    case s20
    case s18
    case s16
    case s14
    case s12
    case s10
    
    var size: CGFloat {
        switch self {
        case .s32:
            return Device.pad ? 42.0 : 32.0
        case .s28:
            return Device.pad ? 32.0 : 28.0
        case .s26:
            return Device.pad ? 30.0 : 26.0
        case .s24:
            return Device.pad ? 28.0 : 24.0
        case .s22:
            return Device.pad ? 26.0 : 22.0
        case .s20:
            return Device.pad ? 24.0 : 20.0
        case .s18:
            return Device.pad ? 22.0 : 18.0
        case .s16:
            return Device.pad ? 20.0 : 16.0
        case .s14:
            return Device.pad ? 18.0 : 14.0
        case .s12:
            return Device.pad ? 16.0 : 12.0
        case .s10:
            return Device.pad ? 14.0 : 10.0
        }
    }
}

extension UIFont {
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CustomFontSize,
        isScaled: Bool = true) -> UIFont {
        
        let fontName: String = font.rawValue + style.rawValue
        
        guard let font = UIFont(name: fontName, size: size.size) else {
            debugPrint("Font \(fontName) can't be loaded")
            return UIFont.systemFont(ofSize: size.size)
        }
        
        return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
    }
}
