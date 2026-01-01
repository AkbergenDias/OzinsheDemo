//
//  LoginViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 13.12.2025.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let loginView = LoginView()
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
//        func if loginView.registerButtonTapped() == true {
//            view.addSubview(RegistrationView)
//        }
        
    }
    

}
