//
//  ChangePasswordViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.03.2026.
//

import UIKit

class PasswordChangeViewController: UIViewController {
    
    let passwordChangeView = PasswordChangeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(passwordChangeView)
        
        passwordChangeView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }

    }
    
}
