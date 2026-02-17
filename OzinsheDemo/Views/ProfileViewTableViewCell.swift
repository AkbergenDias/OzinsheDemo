//
//  ProfileViewTableViewCell.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit
import SnapKit

class ProfileViewTableViewCell: UITableViewCell {

    lazy var titleLabel = {
        let label = UILabel()
        
        label.text = "Жеке деректер"
        
        label.font = UIFont(name:"SFProDisplay-Semibold", size: 16)
        
        label.textColor = UIColor(named: "1C2431")
        
        return label
    }()
    
    lazy var bottomView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "D1D5DB")
        
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
        addSubview(titleLabel)
        addSubview(bottomView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(24)
        }
        
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
