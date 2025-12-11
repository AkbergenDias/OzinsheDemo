//
//  OnboardingView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 08.12.2025.
//

import UIKit
import SnapKit

class OnboardingView: UIView {
    
    lazy var nextButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Өткізу", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 12)
        button.setTitleColor(UIColor(named: "111827"), for: UIControl.State.normal)
        button.backgroundColor = UIColor(named: "F9FAFB")
        
        return button
    }()
    
    lazy var backgroundImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Image-7")
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        
        label.text = "ÖZINŞE-ге қош келдің!"
        
        label.font = UIFont(name:"SFProDisplay-Bold", size: 24)
        
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var subtitleLabel = {
        let label = UILabel()
        
        label.text = """
        Фильмдер, телехикаялар, ситкомдар,
        анимациялық жобалар, телебағдарламалар 
        мен реалити-шоулар, аниме және тағы басқалары
"""
        
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        label.textColor = UIColor(named: "9CA3AF")
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupUI(){
        
        addSubview(backgroundImageView)
        addSubview(nextButton)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        //nextButton
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImageView).inset(60)
            make.right.equalTo(backgroundImageView).inset(16)
            make.width.equalTo(70)
            make.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(473)
            make.bottom.equalToSuperview().inset(310)

        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(32)
            make.top.equalTo(titleLabel).inset(24)
            make.bottom.equalToSuperview().inset(198)
            
        }

    }

}
