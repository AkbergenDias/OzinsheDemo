//
//  LoginView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 13.12.2025.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var titleLabel = {
        let view = UIView()
        let label = UILabel()
        let subtitleLabel = UILabel()
        
        label.text = "Сәлем!"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "6B7280")
        label.textAlignment = .left
        
        subtitleLabel.text = "Аккаунтқа кіріңіз"
        subtitleLabel.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        view.addSubview(label)
        view.addSubview(subtitleLabel)
        
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(124)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(158)
        }
        
        return view
    }()

    lazy var appleSSOButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Apple ID-мен тіркеліңіз", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        button.setTitleColor(UIColor(named: "111827"), for: UIControl.State.normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(named: "E5E7EB")?.cgColor
        
        return button
    }()
    
    lazy var googleSSOButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Google-мен тіркеліңіз", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        button.setTitleColor(UIColor(named: "111827"), for: UIControl.State.normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(named: "E5E7EB")?.cgColor
        
        return button
    }()
    
    lazy var emailField = {
        let view = UIView()
        let field = UITextField()
        let imageView = UIImageView(image: UIImage(named: "Message"))
        
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 12
        
        field.placeholder = "Сіздің email"
        field.textAlignment = .left
        field.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        field.textColor = UIColor(named: "111827")
        
        
        return field
    }()
    
    lazy var nextButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Кіру", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "7E2DFC")
        
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupUI(){
        
        addSubview(titleLabel)
        addSubview(emailField)
        addSubview(nextButton)
        addSubview(appleSSOButton)

        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(124)
        }
        emailField.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(473)
            make.bottom.equalToSuperview().inset(310)

        }
        
        nextButton.snp.makeConstraints { (make) in
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.top.equalToSuperview().inset(463)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
        }
        
        appleSSOButton.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(639)
            make.width.equalTo(327)
            make.height.equalTo(52)
        }

//        appleSSOButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//

    }

}
