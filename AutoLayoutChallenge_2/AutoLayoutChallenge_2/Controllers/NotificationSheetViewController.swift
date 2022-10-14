//
//  NotificationSheetViewController.swift
//  AutoLayoutChallenge_2
//
//  Created by Ekko on 2022/10/14.
//
import UIKit
import SnapKit

class NotificationSheetViewController: UIViewController {
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mail")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Pending Invitaion"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Inter-Regular_SemiBold", size: 17)
        
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Check your inbox to confirm your registration on our app"
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    let receivedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.buttonBlack
        button.setTitle("I received the email", for: .normal)
        button.titleLabel!.font = UIFont(name: "Inter-Regular_SemiBold", size: 20)
        button.addTarget(self, action: #selector(didTapReceivedButton(_:)), for: .touchUpInside)
        button.layer.applyBorder(color: .buttonBlack, radius: 25)
        return button
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Re-send me an invitation"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 17)
        return label
    }()
    
    let testView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.buttonBlack
        view.layer.cornerRadius = 25
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        configureLayout()
        
    }
    
    // Add Subviews
    func addSubviews() {
        view.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(titleLabel)
        container.addSubview(descriptionLabel)
        container.addSubview(receivedButton)
        container.addSubview(bottomLabel)
    }
    
    // SetUp Layout with Snapkit
    func configureLayout() {
        let viewWidth = view.frame.size.width
        let viewHeight = view.frame.size.height
        
        container.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(0)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(viewWidth / 10)
            make.height.equalTo(imageView.snp.width).multipliedBy(1) // Y축
            make.top.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(16)   // Y축
            make.leading.equalTo(32)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)  // Y축
            make.leading.equalTo(32)
        }
        
        receivedButton.snp.makeConstraints { make in
            make.height.equalTo(50) // Y축
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)    // Y축
            make.leading.equalTo(16)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(32)
            make.top.equalTo(receivedButton.snp.bottom).offset(8)
        }
    }
    
    @objc func didTapReceivedButton(_ sender: UIButton!) {
        print("NotificationSheetViewController - didTapReceivedButton")
    }
}
