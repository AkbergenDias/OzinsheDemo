//
//  HomeCollectionReusableView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 03.04.2026.
//

import UIKit
import SnapKit

class HomeCollectionReusableView: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        label.textColor = UIColor(named: "111827")
        return label
    }()
    
    let seeAllButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Барлығы", for: .normal)
            button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 14)
            button.setTitleColor(UIColor(named: "B376F7"), for: .normal)
            return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(titleLabel)
            addSubview(seeAllButton)
            
            titleLabel.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            seeAllButton.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(24)
                make.centerY.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
