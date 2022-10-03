//
//  UIView+Ext.swift
//  ALC_9_28
//
//  Created by Ekko on 2022/10/02.
//

import Foundation
import UIKit

extension UIView {
    
    /// FirstResponder를 반환
    /// - Returns: FirstResponder
    func currentFirstResponder() -> UIResponder? {
        if self.isFirstResponder {
            return self
        }
        
        for view in self.subviews {
            if let responder = view.currentFirstResponder() {
                return responder
            }
        }
        return nil
    }
}
