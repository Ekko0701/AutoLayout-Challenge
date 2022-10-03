//
//  UILabel+Ext.swift
//  ALC_9_28
//
//  Created by Ekko on 2022/09/28.
//

import Foundation
import UIKit

extension UILabel {
    
    /// 텍스트 셋업
    /// - Parameters:
    ///   - text: label
    ///   - style: 폰트 스타일
    ///   - size: 사이즈
    ///   - color: 색상
    func setSFProText(
        text: String = "텍스트",
        style: SFProFontStyle  = .regular,
        size: CGFloat = 11.0,
        color: UIColor = .black)
    {
        self.text = text
        self.font = font.SFProFont(style: style, size: size)
        self.textColor = color
    }
    
    func highlihgtTextColor (targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        //attributedString.addAttribute(.kern, value: 10, range: range)
        attributedText = attributedString
    }
    
    func highlightTextFont (targetString: String, font: UIFont?, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
    }
}



