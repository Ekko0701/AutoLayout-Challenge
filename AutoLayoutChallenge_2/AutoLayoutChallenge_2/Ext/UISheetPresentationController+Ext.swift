//
//  UISheetPresentationController+Ext.swift
//  AutoLayoutChallenge_2
//
//  Created by Ekko on 2022/10/14.
//

import Foundation
import UIKit

extension UISheetPresentationController.Detent.Identifier {
    static let notification = UISheetPresentationController.Detent.Identifier("notification")
}

extension UISheetPresentationController.Detent {
    static let notifi = UISheetPresentationController.Detent.custom(identifier: .notification) { context in
        return 0.4 * context.maximumDetentValue
    }
}
