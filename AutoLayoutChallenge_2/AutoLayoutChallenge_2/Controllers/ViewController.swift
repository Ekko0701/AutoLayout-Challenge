//
//  ViewController.swift
//  AutoLayoutChallenge_2
//
//  Created by Ekko on 2022/10/14.
//

import UIKit

class ViewController: UIViewController, UISheetPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Autolayout"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        checkFont()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    @objc
    func didTapAdd() {
        //view.backgroundColor = .systemMint
        
        let notiSheet = NotificationSheetViewController()
        self.view.backgroundColor = UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.9)
        if let sheet = notiSheet.sheetPresentationController {
            sheet.delegate = self
            sheet.detents = [.notifi]         // Detent 설정
            sheet.prefersGrabberVisible = false // Grabber 숨김
        }
        present(notiSheet, animated: true)
    }
    
    
    // UIPresentationController
    // Sheet가 dismiss될때 호출
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("PresentationControllerWillDismiss")
        self.view.backgroundColor = .white
    }
    
    func checkFont() {
        for family in UIFont.familyNames {
            print(family)
            
            for sub in UIFont.fontNames(forFamilyName: family) {
                print("===> \(sub)")
            }
        }
    }
}



