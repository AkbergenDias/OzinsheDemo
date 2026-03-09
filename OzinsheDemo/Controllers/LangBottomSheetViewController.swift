//
//  LangBottomSheetViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 02.03.2026.
//

import UIKit

class LangBottomSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedLanguageIndex = 0
    let langView = LangBottomSheetView()
    let languages = ["English", "Русский", "Қазақша"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        view.addSubview(langView)
        
        langView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        langView.tableView.dataSource = self
        langView.tableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LangCell", for: indexPath)
            
            cell.textLabel?.text = languages[indexPath.row]
            
            if indexPath.row == selectedLanguageIndex {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLanguageIndex = indexPath.row

        tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.dismiss(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    

}
