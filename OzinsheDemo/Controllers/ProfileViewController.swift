//
//  ProfileViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(profileView)
        
        profileView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }

    }

}
