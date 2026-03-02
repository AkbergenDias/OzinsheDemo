//
//  LangBottomSheetView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 02.03.2026.
//

import UIKit

class LangBottomSheetView: UIView {
    
    // TODO: Add the text UI
    
    let tableView = UITableView()
    let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) { fatalError() }
    
    func setupUI() {
        addSubview(blurEffect)
        addSubview(tableView)
        
        blurEffect.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LangCell" )
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
    }

}
