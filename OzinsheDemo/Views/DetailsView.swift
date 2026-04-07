//
//  DetailsView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 05.04.2026.
//

import UIKit

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
        
        thumbnailImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
            make.width.equalTo(375)
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

}
