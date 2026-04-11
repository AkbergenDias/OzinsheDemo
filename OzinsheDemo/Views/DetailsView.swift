//
//  DetailsView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 05.04.2026.
//

import UIKit
import SnapKit

class DetailsView: UIView {

    lazy var thumbnailImageView: UIImageView = {
        let thumbnail = UIImageView()
        thumbnail.image = UIImage(named: "Image-3")
        thumbnail.backgroundColor = .black
        thumbnail.alpha = 0.9
        thumbnail.contentMode = .scaleAspectFill
        return thumbnail
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.locations = [0.5, 1.0]
        return gradient
    }()
    
    lazy var shareLabel = {
        let label = UILabel()
        
        label.text = "Бөлісу"
        label.font = UIFont(name:"SFProDisplay-SemiBold", size: 12)
        label.textColor = UIColor(named: "D1D5DB")
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var bookmarkLabel = {
        let label = UILabel()
        
        label.text = "Тізімге қосу"
        label.font = UIFont(name:"SFProDisplay-Medium", size: 12)
        label.textColor = UIColor(named: "D1D5DB")
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Play"), for: .normal)
        return button
    }()
    
    lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Bookmark-Outline"), for: .normal)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Share-Outline"), for: .normal)
        return button
    }()
    
    lazy var titleStack: UIStackView = {
        let titleLabel = UILabel()
            titleLabel.text = "Айдар"
            titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
            titleLabel.textColor = UIColor(named: "111827")
            
            let tagsLabel = UILabel()
            tagsLabel.text = "2020 Телехикая 5 сезон, 46 серия, 7 мин"
            tagsLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
            tagsLabel.textColor = UIColor(named: "9CA3AF")
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, tagsLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    
    lazy var movieDescription = {
        let label = UILabel()
        
        label.text = "Шытырман оқиғалы мультсериал Елбасының «Ұлы даланың жеті қыры» бағдарламасы аясында жүзеге асырылған. Мақалада қызғалдақтардың отаны Қазақстан екені айтылады. Ал, жоба қызғалдақтардың отаны – Алатау баурайы екенін анимация тілінде дәлелдей түседі. "
        label.font = UIFont(name:"SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(named: "9CA3AF")
        label.textAlignment = .left
        label.numberOfLines = .max
        
        return label
    }()
    
    lazy var gradientLayerForMovieDesc: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.8).cgColor]
        gradient.locations = [0.5, 1.0]
        return gradient
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
    
    lazy var showDescription: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Толығырақ", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        button.setTitleColor(UIColor(named: "B376F7"), for: .normal)
        return button
    }()
    
    lazy var chaptersButton = {
        let view = UIView()
        let button = UIButton(type: .custom)
        let subtitle = UILabel()
        let accessoryView = UIImageView(image: UIImage(named: "Chevron-Right-Outline"))
        
        button.setTitle("Бөлімдер", for: .normal)
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        button.setTitleColor(UIColor(named: "111827"), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        subtitle.text = "5 сезон 46 серия"
        subtitle.font = UIFont(name:"SFProDisplay-Medium", size: 12)
        subtitle.textColor = UIColor(named: "9CA3AF")
        subtitle.textAlignment = .right
        
        view.addSubview(button)
        view.addSubview(subtitle)
        view.addSubview(accessoryView)
        
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //button.addTarget(self, action: #selector(PICK SELECTOR), for: .touchUpInside)
        
        subtitle.snp.makeConstraints { (make) in
            make.right.equalTo(accessoryView.snp.left).offset(-8)
            make.centerY.equalToSuperview()
        }
        
        accessoryView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        return view
        
    }()
    
    lazy var toggleSwitch: UISwitch = {
       let toggle = UISwitch()
        toggle.onTintColor = UIColor(named: "B376F7")
        toggle.isOn = false
        return toggle
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    lazy var scrollContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var whiteContentArea: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var thumbnailTransparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //THis part is ai didn't know about this
    override func layoutSubviews() {
        super.layoutSubviews()
        // This ensures the gradient always fills the current size of the image view
        gradientLayer.frame = thumbnailImageView.bounds
    }
    
    func setupUI() {
        
        //Static elements
        addSubview(thumbnailImageView)
        thumbnailImageView.layer.addSublayer(gradientLayer)
        addSubview(playButton)
        addSubview(bookmarkButton)
        addSubview(bookmarkLabel)
        addSubview(shareButton)
        addSubview(shareLabel)
        
        //Scroll
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        
        //ScrollComponents
        scrollContentView.addSubview(thumbnailTransparentView)
        scrollContentView.addSubview(whiteContentArea)
        
        //White part details

        whiteContentArea.addSubview(titleStack)
        whiteContentArea.addSubview(bottomView1)
        whiteContentArea.addSubview(movieDescription)
        movieDescription.layer.addSublayer(gradientLayerForMovieDesc)
        whiteContentArea.addSubview(showDescription)
        whiteContentArea.addSubview(bottomView2)
        whiteContentArea.addSubview(chaptersButton)
        whiteContentArea.addSubview(collectionView)
        
        
        thumbnailImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(222)
            make.centerX.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(69)
            make.top.equalToSuperview().offset(234)
        }
        
        shareLabel.snp.makeConstraints { make in
            make.top.equalTo(shareButton.snp.bottomMargin).offset(10)
            make.centerX.equalTo(shareButton.snp.centerX)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(69)
            make.top.equalToSuperview().offset(234)
        }
        bookmarkLabel.snp.makeConstraints { make in
            make.top.equalTo(bookmarkButton.snp.bottomMargin).offset(10)
            make.centerX.equalTo(bookmarkButton.snp.centerX)
        }
        
        //Scroll
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thumbnailTransparentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(230)
        }

        whiteContentArea.snp.makeConstraints { make in
            make.top.equalTo(thumbnailTransparentView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        //White part details

        titleStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        // Divider height constraints
        bottomView1.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }

        movieDescription.snp.makeConstraints { make in
            make.top.equalTo(bottomView1.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        showDescription.snp.makeConstraints { make in
            make.top.equalTo(movieDescription.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(24)
        }

        bottomView2.snp.makeConstraints { make in
            make.top.equalTo(showDescription.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        chaptersButton.snp.makeConstraints { make in
            make.top.equalTo(bottomView2.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(chaptersButton.snp.bottom).offset(32)
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(800)
        }
    }

}
