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
        
        label.text = "Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары"
        
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        
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

    
    func setupUI(){
        
        addSubview(nextButton)
        addSubview(backgroundImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        //nextButton
        nextButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(60)
            make.right.equalToSuperview().inset(16)
        }

    }

}
