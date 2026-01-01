//
//  RegistrationView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 29.12.2025.
//

import UIKit

class RegistrationView: UIView {
    
    lazy var titleLabel = {
        let view = UIView()
        let label = UILabel()
        let subtitleLabel = UILabel()
        
        label.text = "Тіркелу!"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        subtitleLabel.text = "Деректерді толтырыңыз"
        subtitleLabel.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        subtitleLabel.textColor = UIColor(named: "6B7280")
        subtitleLabel.textAlignment = .left
        
        view.addSubview(label)
        view.addSubview(subtitleLabel)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(124)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(158)
        }
        
        return view
    }()
    
    lazy var emailLabel = {
        let label = UILabel()
        
        label.text = "Email"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var loginFieldFrame = {
        let view = UIView()
        let emailField = UITextField()
        let imageView = UIImageView(image: UIImage(named: "Message"))
        
        emailField.placeholder = "Сіздің email"
        emailField.textAlignment = .left
        emailField.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        emailField.textColor = UIColor(named: "111827")
        
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor(named: "E5E7EB")?.cgColor
        
        view.addSubview(imageView)
        view.addSubview(emailField)
        
        imageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(18)
            make.left.equalTo(view).inset(16)
        }
        emailField.snp.makeConstraints { make in
            make.left.equalTo(imageView).inset(26)
            make.verticalEdges.equalTo(view).inset(16)
        }
        //      TODO: Make the emailfield go red if it's not valid Email
        //        if emailField.isValidEmail() == false {
        //            view.layer.borderColor = UIColor(named: "FF402B")?.cgColor
        //        }
        
        return view
    }()
    
    lazy var passwordLabel = {
        let label = UILabel()
        
        label.text = "Құпия сөз"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        return label
    }()
    
    
    lazy var passwordFieldFrame = {
        let view = UIView()
        let passwordField = UITextField()
        let imageView = UIImageView(image: UIImage(named: "Password"))
        let hideButton = UIButton()
        
        passwordField.placeholder = "Сіздің құпия сөзіңіз"
        passwordField.textAlignment = .left
        passwordField.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        passwordField.textColor = UIColor(named: "111827")
        
        hideButton.setImage(UIImage(named: "Show"), for: .normal)
        
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor(named: "E5E7EB")?.cgColor
        
        view.addSubview(imageView)
        view.addSubview(passwordField)
        view.addSubview(hideButton)
        
        imageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(18)
            make.left.equalTo(view).inset(16)
        }
        hideButton.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.verticalEdges.equalTo(view).inset(16)
        }
        passwordField.snp.makeConstraints { make in
            make.left.equalTo(imageView).inset(26)
            make.verticalEdges.equalTo(view).inset(16)
            make.right.equalTo(hideButton).inset(26)
        }
        
        return view
    }()
    
    
    lazy var nextButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Кіру", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "7E2DFC")
        
        return button
    }()
    
    lazy var registerButton = {
        let view = UIView()
        let label = UILabel()
        let button = UIButton()
        
        label.text = "Аккаунтыныз жоқ па?"
        label.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(named: "6B7280")
        label.textAlignment = .center
        
        button.setTitle("Тіркелу", for: .normal)
        button.setTitleColor(UIColor(named: "B376F7"), for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 14)
        button.titleLabel?.textAlignment = .left
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.right.equalTo(label.snp.right).offset(56)
            make.height.equalTo(14)
        }
        
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: func SetupUI
    func setupUI(){
        
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(loginFieldFrame)
        addSubview(passwordLabel)
        addSubview(passwordFieldFrame)
        addSubview(nextButton)
        addSubview(registerButton)
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(16)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(211)
        }
        
        loginFieldFrame.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(236)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(304)
        }
        
        passwordFieldFrame.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(330)
        }
        
        
        nextButton.snp.makeConstraints { (make) in
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.top.equalToSuperview().inset(463)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(543)
        }
        
    
    }
}
