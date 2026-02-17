//
//  ProfileViewHeader.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit
import SnapKit

class ProfileViewHeader: UIView {

    // MARK: UI elements
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DefaultProfileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var myProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "Менің профилім"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "@email"
        label.font = UIFont(name:"SFProDisplay-Medium", size: 14)
        label.textColor = UIColor(named: "9CA3AF")
        label.textAlignment = .center
        return label
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
        
        addSubview(profileImageView)
        addSubview(myProfileLabel)
        addSubview(emailLabel)
        
        
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        
        myProfileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(myProfileLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
        }
        
    }

}
