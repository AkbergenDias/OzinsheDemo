//
//  DetailsViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 05.04.2026.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    

    func setupUI() {
        view.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    
}
