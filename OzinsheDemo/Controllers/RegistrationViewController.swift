//
//  RegistrationViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.03.2026.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let registrationView = RegistrationView()
        view.addSubview(registrationView)
        
        registrationView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        registrationView.onLoginTapped = { [weak self] in
            let loginVC = LoginViewController()
            self?.navigationController?.pushViewController(loginVC, animated: true)
        }
        
    }
}

