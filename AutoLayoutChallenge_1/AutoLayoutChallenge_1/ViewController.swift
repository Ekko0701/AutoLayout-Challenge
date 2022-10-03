//
//  ViewController.swift
//  ALC_9_28
//
//  Created by Ekko on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {

    /// Scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    /// Title Labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    /// Payment View
    @IBOutlet weak var paypalView: UIView!
    @IBOutlet weak var visaView: UIView!
    @IBOutlet weak var mastercardView: UIView!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var amexView: UIView!

    /// Payment Image
    @IBOutlet weak var paypalIamge: UIImageView!
    @IBOutlet weak var visaImage: UIImageView!
    @IBOutlet weak var mastercardImage: UIImageView!
    @IBOutlet weak var dividerImage: UIImageView!
    @IBOutlet weak var amexImage: UIImageView!
    
    /// Payment Info Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var cvcLabel: UILabel!
    @IBOutlet weak var cvcInfo: UILabel!
    
    /// Payment Info Views
    @IBOutlet weak var nameTextView: UIView!
    @IBOutlet weak var numberTextView: UIView!
    @IBOutlet var cardInfoTextView: [UIView]!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    
    @IBOutlet weak var mastercardCheckImage: UIImageView!
    @IBOutlet weak var paypalCheckImage: UIImageView!
    @IBOutlet weak var visaCheckImage: UIImageView!
    @IBOutlet weak var dividerCheckImage: UIImageView!
    @IBOutlet weak var amexCheckImage: UIImageView!
    
    /// Multiplier
    /// default = 0.7
    /// select = 0.75
    @IBOutlet weak var paypalMultiplier: NSLayoutConstraint!
    @IBOutlet weak var visaMultiplier: NSLayoutConstraint!
    @IBOutlet weak var mastercardMultiplier: NSLayoutConstraint!
    @IBOutlet weak var dividerMultiplier: NSLayoutConstraint!
    @IBOutlet weak var amexMultiplier: NSLayoutConstraint!
    
    let defaultMultiplier: CGFloat = 0.7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTitles()
        setUpPayInfo()
        setUpPayment()
        
        ///test
        selectPaymentView()
        
        paypalView.translatesAutoresizingMaskIntoConstraints = false
        visaView.translatesAutoresizingMaskIntoConstraints = false
        mastercardView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        amexView.translatesAutoresizingMaskIntoConstraints = false
        
        paypalIamge.translatesAutoresizingMaskIntoConstraints = false
        visaImage.translatesAutoresizingMaskIntoConstraints = false
        mastercardImage.translatesAutoresizingMaskIntoConstraints = false
        dividerImage.translatesAutoresizingMaskIntoConstraints = false
        amexImage.translatesAutoresizingMaskIntoConstraints = false
        
        paypalCheckImage.isHidden = true
        visaCheckImage.isHidden = true
        mastercardCheckImage.isHidden = false
        dividerCheckImage.isHidden = true
        amexCheckImage.isHidden = true
        
        hideKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow) , name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setUpTitles() {
        titleLabel.setSFProText(text: "Enter your payment details", style: .bold, size: 16, color: .black)
        
        subTitleLabel.setSFProText(text: "By continuing you agree to our Terms", style: .light, size: 12.5, color: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        subTitleLabel.highlihgtTextColor(targetString: "Terms", color: .blue)
    }
    
    private func setUpPayment() {
        paypalView.layer.applyShadow(color: .shadowGray , alpha: 1, x: 0, y: 6.25, blur: 6.25, spread: 1)
        paypalView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.12)
        
        visaView.layer.applyShadow(color: .shadowGray , alpha: 1, x: 0, y: 6.25, blur: 6.25, spread: 1)
        visaView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.12)
        
        mastercardView.layer.applyShadow(color: .shadowGray , alpha: 1, x: 0, y: 6.25, blur: 6.25, spread: 1)
        mastercardView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.12)
        
        dividerView.layer.applyShadow(color: .shadowGray , alpha: 1, x: 0, y: 6.25, blur: 6.25, spread: 1)
        dividerView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.12)
        
        amexView.layer.applyShadow(color: .shadowGray , alpha: 1, x: 0, y: 6.25, blur: 6.25, spread: 1)
        amexView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.12)
    }
    
    private func setUpPayInfo() {
        nameLabel.setSFProText(text: "Cardholder name", style: .semibold, size: 15, color: .black)
        numberLabel.setSFProText(text: "Card Number", style: .semibold, size: 15, color: .black)
        monthLabel.setSFProText(text: "Exp Month", style: .semibold, size: 15, color: .black)
        yearLabel.setSFProText(text: "Exp Year", style: .semibold, size: 15, color: .black)
        cvcLabel.setSFProText(text: "CVC", style: .semibold, size: 15, color: .black)
        
        
        cvcInfo.setSFProText(text: "3 or 4 digits usually found on the signature strip", style: .regular, size: 8.59, color: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        
        cvcInfo.numberOfLines = 0
        cvcInfo.lineBreakMode = .byWordWrapping
        cvcInfo.textAlignment = .left
        
        nameTextView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.91)
        numberTextView.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.91)
        for x in cardInfoTextView {
            x.layer.applyBorder(width: 0.78, color: .paymentBorderGray, radius: 3.91)
        }
        
        nameTextField.borderStyle = .none
        numberTextField.borderStyle = .none
        monthTextField.borderStyle = .none
        yearTextField.borderStyle = .none
        cvcTextField.borderStyle = .none        
    }

    private func selectPaymentView() {
        let paypalGesture = UITapGestureRecognizer(target: self, action: #selector(selectPaypal(_:)))
        paypalView.addGestureRecognizer(paypalGesture)
        paypalView.isUserInteractionEnabled = true
        
        let visaGesture = UITapGestureRecognizer(target: self, action: #selector(selectVisa(_:)))
        visaView.addGestureRecognizer(visaGesture)
        visaView.isUserInteractionEnabled = true
        
        let mastercardGesture = UITapGestureRecognizer(target: self, action: #selector(selectMastercard(_:)))
        mastercardView.addGestureRecognizer(mastercardGesture)
        mastercardView.isUserInteractionEnabled = true
        
        let dividerGesture = UITapGestureRecognizer(target: self, action: #selector(selectDivider(_:)))
        dividerView.addGestureRecognizer(dividerGesture)
        dividerView.isUserInteractionEnabled = true
        
        let amexGesture = UITapGestureRecognizer(target: self, action: #selector(selectAmex(_:)))
        amexView.addGestureRecognizer(amexGesture)
        amexView.isUserInteractionEnabled = true
        
    }
    
    @objc
    func selectPaypal(_ gesture: UITapGestureRecognizer) {
        print("Paypal 선택")
        
        let newConstraint = paypalMultiplier.constraintWithMultiplier(0.76)
        paypalView.removeConstraint(paypalMultiplier)
        paypalView.addConstraint(newConstraint)
        paypalView.layoutIfNeeded()
        paypalMultiplier = newConstraint
        
        let visadefaultCons = visaMultiplier.constraintWithMultiplier(defaultMultiplier)
        visaView.removeConstraint(visaMultiplier)
        visaView.addConstraint(visadefaultCons)
        visaMultiplier = visadefaultCons
        visaView.layoutIfNeeded()
        
        let masterDefaultCons = mastercardMultiplier.constraintWithMultiplier(defaultMultiplier)
        mastercardView.removeConstraint(mastercardMultiplier)
        mastercardView.addConstraint(masterDefaultCons)
        mastercardMultiplier = masterDefaultCons
        mastercardView.layoutIfNeeded()
        
        let dividerDefaultCons  = dividerMultiplier.constraintWithMultiplier(defaultMultiplier)
        dividerView.removeConstraint(visaMultiplier)
        dividerView.addConstraint(dividerDefaultCons)
        dividerMultiplier = dividerDefaultCons
        dividerView.layoutIfNeeded()
        
        let amexDefaultCons = amexMultiplier.constraintWithMultiplier(defaultMultiplier)
        amexView.removeConstraint(amexMultiplier)
        amexView.addConstraint(amexDefaultCons)
        amexMultiplier = amexDefaultCons
        amexView.layoutIfNeeded()
        
        paypalCheckImage.isHidden = false
        visaCheckImage.isHidden = true
        mastercardCheckImage.isHidden = true
        dividerCheckImage.isHidden = true
        amexCheckImage.isHidden = true
        
        setUpPayment()
    }

    
    @objc
    func selectVisa(_ gesture: UITapGestureRecognizer) {
        print("Visa 선택")
        
        let newConstraint = visaMultiplier.constraintWithMultiplier(0.76)
        visaView.removeConstraint(visaMultiplier)
        visaView.addConstraint(newConstraint)
        visaView.layoutIfNeeded()
        visaMultiplier = newConstraint
        
        /// default로 초기화
        let paypalDefaultCons = paypalMultiplier.constraintWithMultiplier(defaultMultiplier)
        
        paypalView.removeConstraint(paypalMultiplier)
        paypalView.addConstraint(paypalDefaultCons)
        paypalMultiplier = paypalDefaultCons
        paypalView.layoutIfNeeded()
        
        let masterDefaultCons = mastercardMultiplier.constraintWithMultiplier(defaultMultiplier)
        mastercardView.removeConstraint(mastercardMultiplier)
        mastercardView.addConstraint(masterDefaultCons)
        mastercardMultiplier = masterDefaultCons
        mastercardView.layoutIfNeeded()
        
        let dividerDefaultCons  = dividerMultiplier.constraintWithMultiplier(defaultMultiplier)
        dividerView.removeConstraint(visaMultiplier)
        dividerView.addConstraint(dividerDefaultCons)
        dividerMultiplier = dividerDefaultCons
        dividerView.layoutIfNeeded()
        
        let amexDefaultCons = amexMultiplier.constraintWithMultiplier(defaultMultiplier)
        amexView.removeConstraint(amexMultiplier)
        amexView.addConstraint(amexDefaultCons)
        amexMultiplier = amexDefaultCons
        amexView.layoutIfNeeded()
        
        paypalCheckImage.isHidden = true
        visaCheckImage.isHidden = false
        mastercardCheckImage.isHidden = true
        dividerCheckImage.isHidden = true
        amexCheckImage.isHidden = true
        
        setUpPayment()
    }
    
    @objc
    func selectMastercard(_ gesture: UITapGestureRecognizer) {
        print("Mastercard 선택")
        // mastercardCheckImage.isHidden = false
        
        let newConstraint = mastercardMultiplier.constraintWithMultiplier(0.76)
        mastercardView.removeConstraint(mastercardMultiplier)
        mastercardView.addConstraint(newConstraint)
        mastercardView.layoutIfNeeded()
        mastercardMultiplier = newConstraint
        
        /// default로 초기화
        let paypalDefaultCons = paypalMultiplier.constraintWithMultiplier(defaultMultiplier)
        
        paypalView.removeConstraint(paypalMultiplier)
        paypalView.addConstraint(paypalDefaultCons)
        paypalMultiplier = paypalDefaultCons
        paypalView.layoutIfNeeded()
        
        let visaDefaultCons = visaMultiplier.constraintWithMultiplier(defaultMultiplier)
        visaView.removeConstraint(visaMultiplier)
        visaView.addConstraint(visaDefaultCons)
        visaMultiplier = visaDefaultCons
        visaView.layoutIfNeeded()
        
        let dividerDefaultCons  = dividerMultiplier.constraintWithMultiplier(defaultMultiplier)
        dividerView.removeConstraint(dividerMultiplier)
        dividerView.addConstraint(dividerDefaultCons)
        dividerMultiplier = dividerDefaultCons
        dividerView.layoutIfNeeded()
        
        let amexDefaultCons = amexMultiplier.constraintWithMultiplier(defaultMultiplier)
        amexView.removeConstraint(amexMultiplier)
        amexView.addConstraint(amexDefaultCons)
        amexMultiplier = amexDefaultCons
        amexView.layoutIfNeeded()
        
        paypalCheckImage.isHidden = true
        visaCheckImage.isHidden = true
        mastercardCheckImage.isHidden = false
        dividerCheckImage.isHidden = true
        amexCheckImage.isHidden = true
        
        setUpPayment()
    }
    
    @objc
    func selectDivider(_ gesture: UITapGestureRecognizer) {
        print("Divider 선택")
        
        let newConstraint = dividerMultiplier.constraintWithMultiplier(0.76)
        dividerView.removeConstraint(dividerMultiplier)
        dividerView.addConstraint(newConstraint)
        dividerView.layoutIfNeeded()
        dividerMultiplier = newConstraint
        
        /// default로 초기화
        let paypalDefaultCons = paypalMultiplier.constraintWithMultiplier(defaultMultiplier)
        
        paypalView.removeConstraint(paypalMultiplier)
        paypalView.addConstraint(paypalDefaultCons)
        paypalMultiplier = paypalDefaultCons
        paypalView.layoutIfNeeded()
        
        let visaDefaultCons = visaMultiplier.constraintWithMultiplier(defaultMultiplier)
        visaView.removeConstraint(visaMultiplier)
        visaView.addConstraint(visaDefaultCons)
        visaMultiplier = visaDefaultCons
        visaView.layoutIfNeeded()
        
        let mastercardDefaultCons  = mastercardMultiplier.constraintWithMultiplier(defaultMultiplier)
        mastercardView.removeConstraint(mastercardMultiplier)
        mastercardView.addConstraint(mastercardDefaultCons)
        mastercardMultiplier = mastercardDefaultCons
        mastercardView.layoutIfNeeded()
        
        let amexDefaultCons = amexMultiplier.constraintWithMultiplier(defaultMultiplier)
        amexView.removeConstraint(amexMultiplier)
        amexView.addConstraint(amexDefaultCons)
        amexMultiplier = amexDefaultCons
        amexView.layoutIfNeeded()
        
        paypalCheckImage.isHidden = true
        visaCheckImage.isHidden = true
        mastercardCheckImage.isHidden = true
        dividerCheckImage.isHidden = false
        amexCheckImage.isHidden = true
        
        setUpPayment()
    }
    
    @objc
    func selectAmex(_ gesture: UITapGestureRecognizer) {
        print("Amex 선택")
        let newConstraint = amexMultiplier.constraintWithMultiplier(0.76)
        amexView.removeConstraint(amexMultiplier)
        amexView.addConstraint(newConstraint)
        amexView.layoutIfNeeded()
        amexMultiplier = newConstraint
        
        /// default로 초기화
        let paypalDefaultCons = paypalMultiplier.constraintWithMultiplier(defaultMultiplier)
        
        paypalView.removeConstraint(paypalMultiplier)
        paypalView.addConstraint(paypalDefaultCons)
        paypalMultiplier = paypalDefaultCons
        paypalView.layoutIfNeeded()
        
        let visaDefaultCons = visaMultiplier.constraintWithMultiplier(defaultMultiplier)
        visaView.removeConstraint(visaMultiplier)
        visaView.addConstraint(visaDefaultCons)
        visaMultiplier = visaDefaultCons
        visaView.layoutIfNeeded()
        
        let mastercardDefaultCons  = mastercardMultiplier.constraintWithMultiplier(defaultMultiplier)
        mastercardView.removeConstraint(mastercardMultiplier)
        mastercardView.addConstraint(mastercardDefaultCons)
        mastercardMultiplier = mastercardDefaultCons
        mastercardView.layoutIfNeeded()
        
        let dividerDefaultCons = dividerMultiplier.constraintWithMultiplier(defaultMultiplier)
        dividerView.removeConstraint(dividerMultiplier)
        dividerView.addConstraint(dividerDefaultCons)
        dividerMultiplier = dividerDefaultCons
        dividerView.layoutIfNeeded()
        
        paypalCheckImage.isHidden = true
        visaCheckImage.isHidden = true
        mastercardCheckImage.isHidden = true
        dividerCheckImage.isHidden = true
        amexCheckImage.isHidden = false
        
        setUpPayment()
    }
}

extension ViewController {
    
    /// 키보드에 따른 scrollView inset 변경
    /// - Parameter notification
    @objc private func keyboardWillShow2(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.size.height, right: 0.0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        
    }
    
    /// TextField가 여러개 존재하는 경우에 현재 입력하려고 하는 TextField를 알아내 화면에 잘 보이도록 스크롤을 적절히 조절하는 함수
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset.bottom = keyboardFrame.size.height
        
        let firstResponder = view.currentFirstResponder()
        
        if let textView = firstResponder as? UITextView {
            scrollView.scrollRectToVisible(textView.frame, animated: true)
        }
    }
    
    /// 키보드 사라질때 scrollView inset 변경
    @objc private func keyboardWillHide() {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
}



