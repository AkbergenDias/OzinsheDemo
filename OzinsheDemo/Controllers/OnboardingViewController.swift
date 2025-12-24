//
//  OnboardingViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 08.12.2025.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    let onboardingView = OnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        onboardingView.onNextTapped = { [weak self] in
                let vc = LoginViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }

    }
    

}
