//
//  HomeCollectionViewCell.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 20.12.2025.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.contentMode = .scaleAspectFill
        ImageView.clipsToBounds = true
        return ImageView
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "Қызғалдақтар мекені"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        return label
    }()
    
    lazy var subtitleLabel = {
        let label = UILabel()
        label.text = "Шытырман оқиғалы мультсериал Елбасының «Ұлы даланың жеті қыры» бағдарламасы аясында жүз..."
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = UIColor(named: "9CA3AF")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupImage(_ image: UIImage) {
        imageView.image = image
    }

}
