//
//  ProfileViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 17.02.2026.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(profileView)
        
        profileView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        profileView.personalDataButtonTapped = { [weak self] in
            let vc = ProfileEditViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        
        profileView.languageButtonTapped = { [weak self] in
            let langVC = LangBottomSheetViewController()
            
            if let sheet = langVC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.preferredCornerRadius = 23
                sheet.prefersGrabberVisible = true
            }
            self?.present(langVC, animated: true)
            
        }

    }

}
