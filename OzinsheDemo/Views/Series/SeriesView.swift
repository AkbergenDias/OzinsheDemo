//
//  SeriesView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 11.04.2026.
//

import UIKit
import SnapKit

class SeriesView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.separatorStyle = .none
        table.register(SeriesTableViewCell.self, forCellReuseIdentifier: "SeriesCell")
        return table
        
    }()

    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        generateButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(tableView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview()
            make.height.equalTo(34)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom).offset(24)
        }
    }
    
    func generateButtons() {
        for i in 1..<10 {
            let button = UIButton()
            button.setTitle("\(i) cезон", for: .normal)
            button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
            button.setTitleColor(UIColor(named: "F9FAFB"), for: .normal)
            button.layer.cornerRadius = 8
            button.backgroundColor = UIColor(named: "9753F0")
            
            button.snp.makeConstraints { make in
                make.width.equalTo(76)
            }
            
            stackView.addArrangedSubview(button)
        }
    }


}
