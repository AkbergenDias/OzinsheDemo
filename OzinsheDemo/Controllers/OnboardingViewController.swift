//
//  OnboardingViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 08.12.2025.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let onboardingView = OnboardingView()
        view.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }

    }
//    
//    func pushToMain() {
//        let mainViewController = TabBarViewController()
//        navigationController?.pushViewController(mainViewController, animated: true)
//    }

}
