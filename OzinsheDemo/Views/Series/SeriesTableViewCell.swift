//
//  SeriesTableViewCell.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 14.04.2026.
//

import UIKit
import SnapKit

class SeriesTableViewCell: UITableViewCell {

    lazy var posterImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "Серия"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "111827")
        label.textAlignment = .left

        return label
    }()
    
    lazy var lineView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "D1D5DB")
        
        return view
    }()
    
    lazy var bottomView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(bottomView)
        
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(178)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
        }

    }
}
