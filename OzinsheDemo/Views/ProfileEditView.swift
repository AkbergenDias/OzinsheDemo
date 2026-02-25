//
//  ProfileEditView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 25.02.2026.
//

import UIKit

class ProfileEditView: UIView {
    
    let tableView = UITableView()
    
    lazy var saveButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "7E2DFC")
        button.isEnabled = true
        button.isHidden = false
        
        return button
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
        addSubview(tableView)
        addSubview(saveButton)
        
        tableView.register(EditFieldCell.self, forCellReuseIdentifier: "EditCell")
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(132)
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.top.equalTo(tableView.snp.bottom).offset(250)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }

}

class EditFieldCell: UITableViewCell {
    
    let textField = UITextField()
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(textField)
        contentView.addSubview(title)
        

        textField.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        textField.textColor = UIColor(named: "111827")
        
        
        title.font = UIFont(name:"SFProDisplay-Bold", size: 14)
        title.textColor = UIColor(named: "9CA3AF")

        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.left.equalToSuperview()
        }
        
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
    }

}
