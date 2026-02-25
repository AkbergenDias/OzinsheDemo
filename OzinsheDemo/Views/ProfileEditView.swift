//
//  ProfileEditView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 25.02.2026.
//

import UIKit

class ProfileEditView: UIView {
    
    lazy var nameRow = {
        let view = UIView()
        let title = UITextField()
        let subtitle = UILabel()
        
        title.text = "User Name"
        title.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        title.textColor = UIColor(named: "111827")
        title.textAlignment = .left
        
        subtitle.text = "Сіздің атыңыз"
        subtitle.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        subtitle.textColor = UIColor(named: "9CA3AF")
        subtitle.textAlignment = .left
        
        view.addSubview(title)
        view.addSubview(subtitle)
        
        title.snp.makeConstraints { (make) in
            make.top.equalTo(subtitle.snp.bottom).offset(8)
            make.left.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        return view
        
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
        addSubview(nameRow)
        
        nameRow.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(132)
            make.horizontalEdges.equalToSuperview().offset(24)
            make.height.equalTo(65)
        }
    }

}

class ProfileEditTableView: UITableView {
    
}
