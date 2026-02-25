//
//  ProfileViewHeader.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit
import SnapKit

class ProfileView: UIView {

    // MARK: UI elements
    
    lazy var profileHeaderView = {
        let view = UIView()
        let imageView = UIImageView()
        let label = UILabel()
        let emailLabel = UILabel()
        
        imageView.image = UIImage(named: "DefaultProfileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        label.text = "Менің профилім"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .center

        emailLabel.text = "@email"
        emailLabel.font = UIFont(name:"SFProDisplay-Medium", size: 14)
        emailLabel.textColor = UIColor(named: "9CA3AF")
        emailLabel.textAlignment = .center
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(emailLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
        }
        
        return view
        
    }()
    
    // TODO: Continue this
    lazy var personalDataButton = {
        let view = UIView()
        let button = UIButton(type: .custom)
        let subtitle = UILabel()
        let accessoryView = UIImageView(image: UIImage(named: "Chevron-Right-Outline"))
        
        button.setTitle("Жеке деректер", for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        button.setTitleColor(UIColor(named: "111827"), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        subtitle.text = "Өңдеу"
        subtitle.font = UIFont(name:"SFProDisplay-Medium", size: 12)
        subtitle.textColor = UIColor(named: "9CA3AF")
        subtitle.textAlignment = .center
        
        view.addSubview(button)
        view.addSubview(subtitle)
        view.addSubview(accessoryView)
        
        button.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.right.equalToSuperview().offset(-24)
        }
        
        accessoryView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.right.equalToSuperview()
        }
        
        return view
        
    }()
    
    lazy var passwordChangeButton = {
        let view = UIView()
        let button = UIButton(type: .custom)
        let accessoryView = UIImageView(image: UIImage(named: "Chevron-Right-Outline"))
        
        button.setTitle("Құпия сөзді өзгерту", for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        button.setTitleColor(UIColor(named: "111827"), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        view.addSubview(button)
        view.addSubview(accessoryView)
        
        button.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalToSuperview()
        }
        
        accessoryView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.right.equalToSuperview()
        }
        
        return view
        
    }()
    
    lazy var languageSelectButton = {
        let view = UIView()
        let button = UIButton(type: .custom)
        let subtitle = UILabel()
        let accessoryView = UIImageView(image: UIImage(named: "Chevron-Right-Outline"))
        
        button.setTitle("Тіл", for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        button.setTitleColor(UIColor(named: "111827"), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        subtitle.text = "Қазақша"
        subtitle.font = UIFont(name:"SFProDisplay-Medium", size: 12)
        subtitle.textColor = UIColor(named: "9CA3AF")
        subtitle.textAlignment = .center
        
        view.addSubview(button)
        view.addSubview(subtitle)
        view.addSubview(accessoryView)
        
        button.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.right.equalToSuperview().offset(-24)
        }
        
        accessoryView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.right.equalToSuperview()
        }
        
        return view
        
    }()
    
    lazy var toggleSwitch: UISwitch = {
       let toggle = UISwitch()
        toggle.onTintColor = UIColor(named: "B376F7")
        toggle.isOn = false
        return toggle
    }()
    
    lazy var darkModeButton = {
        let view = UIView()
        let button = UIButton(type: .custom)
        let accessoryView = UIImageView(image: UIImage(named: "Chevron-Right-Outline"))
        
        button.setTitle("Қараңғы режим", for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        button.setTitleColor(UIColor(named: "111827"), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        view.addSubview(button)
        view.addSubview(toggleSwitch)
        
        button.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalToSuperview()
        }
        
        toggleSwitch.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        return view
        
    }()
    
    lazy var bottomView1 = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "D1D5DB")
        return view
    }()
    
    lazy var bottomView2 = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "D1D5DB")
        return view
    }()
    
    lazy var bottomView3 = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "D1D5DB")
        return view
    }()

    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup UI function
    func setupUI(){
        
        addSubview(profileHeaderView)
        addSubview(personalDataButton)
        addSubview(passwordChangeButton)
        addSubview(languageSelectButton)
        addSubview(darkModeButton)
        addSubview(bottomView1)
        addSubview(bottomView2)
        addSubview(bottomView3)
        
        profileHeaderView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(132)
            make.centerX.equalToSuperview()
            
        }
        
        personalDataButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileHeaderView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        passwordChangeButton.snp.makeConstraints { (make) in
            make.top.equalTo(personalDataButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        languageSelectButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordChangeButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        darkModeButton.snp.makeConstraints { (make) in
            make.top.equalTo(languageSelectButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        bottomView1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(personalDataButton.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        bottomView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(passwordChangeButton.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        bottomView3.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(languageSelectButton.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        
    }

}
