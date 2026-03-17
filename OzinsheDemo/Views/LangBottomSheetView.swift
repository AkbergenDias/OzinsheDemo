//
//  LangBottomSheetView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 02.03.2026.
//

import UIKit

class LangCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        textLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        tintColor = UIColor(named: "B376F7") ?? .purple
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

class LangBottomSheetView: UIView {
    
    // TODO: Add the text UI
    
    
    lazy var blurEffect: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .extraLight)
        return UIVisualEffectView(effect: blur)
    }()
        
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Тілді таңдаңыз"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.register(LangCell.self, forCellReuseIdentifier: "LangCell")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError() }
    
    func setupUI() {
        addSubview(blurEffect)
        addSubview(tableView)
        addSubview(titleLabel)

        
        blurEffect.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
                
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.left.equalToSuperview().inset(24)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
    }

}
