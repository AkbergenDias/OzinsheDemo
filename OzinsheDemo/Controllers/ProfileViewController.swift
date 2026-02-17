//
//  ProfileViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    var headerView = ProfileViewHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.tableHeaderView = headerView

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileViewTableViewCell()
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let header = tableView.tableHeaderView as? ProfileViewHeader {
            let newSize = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            
            if header.frame.size.height != newSize.height {
                header.frame.size.height = newSize.height
                tableView.tableHeaderView = header
            }
        }
    }
    

}
