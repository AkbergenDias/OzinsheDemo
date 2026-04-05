//
//  LoginViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 13.12.2025.
//

import UIKit
import SnapKit

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
        
        loginView.onNextTapped = { [weak self] in
            let vc = TabBarViewController()
            
            guard let window = self?.view.window else { return }
            
            window.rootViewController = vc
            
            window.makeKeyAndVisible()
            
            UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: nil,
                completion: nil
            )
            
            }
        
        loginView.onRegisterTapped = { [weak self] in
        let regVC = RegistrationViewController()
            self?.navigationController?.pushViewController(regVC, animated: true)
        }

    }
    

}
