//
//  UIFont+Ext.swift
//  ALC_9_28
//
//  Created by Ekko on 2022/09/28.
//

import Foundation
import UIKit

enum SFProFontStyle {
    case regular, semibold, bold, light
}

extension UIFont {
    
    
    func SFProFont(style: SFProFontStyle, size: CGFloat) -> UIFont {
        var font = ""
        
        switch style {
        case .regular:
            font = "SFPro-Regular"
        case .semibold:
            font = "SFPro-Semibold"
        case .bold:
            font = "SFPro-Bold"
        case .light:
            font = "SFPro-Light"
        }
        
        return UIFont(name: font, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
