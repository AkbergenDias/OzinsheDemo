//
//  HomeCollectionViewCell.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 20.12.2025.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
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
        
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        cellImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentView)
        }
        subtitleLabel.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupImage(_ image: UIImage) {
        cellImageView.image = image
    }

}
