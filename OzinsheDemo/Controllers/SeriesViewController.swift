//
//  SeriesViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 11.04.2026.
//

import UIKit

class SeriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let seriesView = SeriesView()
    var seriesList = ["1-серия",  "2-серия", "3-серия", "4-серия",  "5-серия", "6-серия"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        seriesView.tableView.dataSource = self
        seriesView.tableView.delegate = self

    }

    
    func setupUI() {
        view.addSubview(seriesView)
        
        seriesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return seriesList.count
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = VideoPlayerViewController()
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeriesCell", for: indexPath)
        return cell
        
    }
    

}
