//
//  ProfileEditViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 25.02.2026.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    let profileEditView = ProfileEditView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileEditView)
        
        profileEditView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
