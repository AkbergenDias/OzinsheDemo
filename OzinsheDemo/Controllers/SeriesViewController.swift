//
//  SeriesViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 11.04.2026.
//

import UIKit

class SeriesViewController: UIViewController {
    
    let seriesView = SeriesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI() {
        view.addSubview(seriesView)
        
        seriesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    


}
