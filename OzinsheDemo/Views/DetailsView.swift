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
        thumbnail.alpha = 0.5
        thumbnail.contentMode = .scaleAspectFill
        return thumbnail
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
            tagsLabel.textColor = UIColor(named: "111827")
        
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
        
        return label
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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        return view
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(thumbnailImageView)
        addSubview(collectionView)
        addSubview(playButton)
        addSubview(bookmarkLabel)
        addSubview(shareLabel)
        addSubview(bookmarkButton)
        addSubview(shareButton)
        addSubview(titleStack)
        addSubview(movieDescription)
        addSubview(bottomView1)
        addSubview(bottomView2)
        addSubview(showDescription)
        
        
        thumbnailImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.top).offset(-38)
            make.centerX.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(69)
            make.bottom.equalTo(collectionView.snp.top).offset(-50)
        }
        
        shareLabel.snp.makeConstraints { make in
            make.top.equalTo(shareButton.snp.bottomMargin).offset(10)
            make.centerX.equalTo(shareButton.snp.centerX)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(69)
            make.bottom.equalTo(collectionView.snp.top).offset(-50)
        }
        bookmarkLabel.snp.makeConstraints { make in
            make.top.equalTo(bookmarkButton.snp.bottomMargin).offset(10)
            make.centerX.equalTo(bookmarkButton.snp.centerX)
        }
        
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        // Divider height constraints
        bottomView1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(titleStack.snp.bottom).offset(24)
        }
        
        bottomView2.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(bottomView1.snp.bottom).offset(24)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

}
