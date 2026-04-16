//
//  OnboardingView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 08.12.2025.
//

import UIKit
import SnapKit

class OnboardingView: UIView {
    
    // This one responsible for the button that pushes into LoginVC
    var onNextTapped: (() -> Void)?
    
    // MARK: UI elements
    lazy var onboardingButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Өткізу", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Regular", size: 12)
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
    
    let subtitleTexts = ("Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары", "Кез келген құрылғыдан қара Сүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара", "Тіркелу оңай. Қазір тіркел де қалаған фильміңе қол жеткіз")
    
    lazy var subtitleLabel = {
        let label = UILabel()
        
        label.text = subtitleTexts.0
        
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        
        label.textColor = UIColor(named: "9CA3AF")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()
    
    lazy var sliderImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Slider Indicator-1")
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var nextButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Әрі қарай", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "7E2DFC")
        button.isEnabled = false
        button.isHidden = true
        
        return button
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
        
        addSubview(backgroundImageView)
        addSubview(onboardingButton)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(sliderImageView)
        addSubview(nextButton)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        onboardingButton.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImageView).inset(90)
            make.right.equalTo(backgroundImageView).inset(16)
            make.width.equalTo(70)
            make.height.equalTo(24)
        }
        onboardingButton.addTarget(self, action: #selector(onboardingButtonTapped), for: .touchUpInside)
        
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
        
        sliderImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(168)
            make.left.equalToSuperview().inset(167)
            make.top.equalToSuperview().inset(654)
            make.bottom.equalToSuperview().inset(152)
            make.width.equalTo(40)
            make.height.equalTo(6)
        }
        nextButton.snp.makeConstraints { (make) in
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.top.equalTo(sliderImageView.snp.bottom).offset(24)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)


    }
    
    // MARK: UI functions
    private var buttonTapCount = 0

    @objc func onboardingButtonTapped() {
        buttonTapCount += 1
        if buttonTapCount == 1 {
            print("Onboarding button tapped")
            backgroundImageView.image = UIImage(named: "Image-8")
            sliderImageView.image = UIImage(named: "Slider Indicator-2")
            titleLabel.text = "ÖZINŞE-ге қош келдің!"
            subtitleLabel.text = subtitleTexts.1
        }
        else if buttonTapCount == 2 {
            print("Onboarding button tapped")
            backgroundImageView.image = UIImage(named: "Image-9")
            sliderImageView.image = UIImage(named: "Slider Indicator-3")
            titleLabel.text = "ÖZINŞE-ге қош келдің!"
            subtitleLabel.text = subtitleTexts.2
            onboardingButton.isHidden = true
            nextButton.isEnabled = true
            nextButton.isHidden = false
        }
    }
    
    @objc func nextButtonTapped() {
        onNextTapped?()
    }

}
