//
//  SeriesView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 11.04.2026.
//

import UIKit

class SeriesView: UIView {
    
    lazy var tableView: UITableView = {
            let table = UITableView()
            table.backgroundColor = .white
            table.separatorStyle = .none
            table.register(SeriesTableViewCell.self, forCellReuseIdentifier: "SeriesCell")
            return table
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(tableView)
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    

}
