//
//  UIViewController+Ext.swift
//  ALC_9_28
//
//  Created by Ekko on 2022/10/02.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// 키보드를 제외한 공간 터치시 키보드 숨기기
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
