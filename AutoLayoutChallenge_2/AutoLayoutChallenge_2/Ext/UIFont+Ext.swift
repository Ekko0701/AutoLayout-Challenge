//
//  UIFont+Ext.swift
//  AutoLayoutChallenge_2
//
//  Created by Ekko on 2022/10/14.
//

import Foundation
import UIKit

enum InterFontStyle {
    case regular, semibold
}

extension UIFont {
    
    func InterFont(style: InterFontStyle, size: CGFloat) -> UIFont {
        var font = ""
        
        switch style {
        case .regular:
            font = "Inter-Regular"
        case .semibold:
            font = "Inter-Regular-SemiBold"
        }
        
        return UIFont(name: font, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
