//
//  HomeCollectionViewCell.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 20.12.2025.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.contentMode = .scaleAspectFill
        ImageView.clipsToBounds = true
        return ImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupImage(_ image: UIImage) {
        imageView.image = image
    }

}
