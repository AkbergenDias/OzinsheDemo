//
//  ChangePasswordView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.03.2026.
//

import UIKit

class PasswordChangeView: UIView {
    
    lazy var passwordLabelCurrent = {
        let label = UILabel()
        
        label.text = "Құпия сөз"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var passwordFieldCurrent = {
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
    
    lazy var passwordLabelNew = {
        let label = UILabel()
        
        label.text = "Құпия сөз"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var passwordFieldNew = {
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
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: func SetupUI
    func setupUI(){
        
        addSubview(passwordFieldCurrent)
        addSubview(passwordLabelCurrent)
        addSubview(passwordLabelNew)
        addSubview(passwordFieldNew)
        
        
        passwordLabelCurrent.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(304)
        }
        
        passwordFieldCurrent.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(330)
        }
        
        passwordLabelNew.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(304)
        }
        
        passwordFieldNew.snp.makeConstraints { (make) in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(330)
        }
        
    }
    

}
