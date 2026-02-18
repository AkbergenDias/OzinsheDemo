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
            make.bottom.equalTo(emailLabel.snp.top).offset(8)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        return view
        
    }()
    
    // TODO: Continue this
//    lazy var personalDataButton = {
//        let button = UIButton(type: .custom)
//        
//        button.setTitle("Жеке деректер", for: .normal)
//        button.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 16)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(named: "7E2DFC")
//        button.isEnabled = false
//        button.isHidden = true
//        
//        return button
//        
//        
//        
//    }()

    
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
        
        profileHeaderView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            
        }
        
        
        
    }

}
