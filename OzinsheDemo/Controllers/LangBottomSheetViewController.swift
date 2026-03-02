//
//  LangBottomSheetViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 02.03.2026.
//

import UIKit

class LangBottomSheetViewController: UIViewController {
    
    var selectedLanguageIndex = 0
    let langView = LangBottomSheetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(langView)
        
        langView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }

    }
    
    func tableView(_ tablView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let languages = ["English", "Русский", "Қазақша"]
        
        cell.textLabel?.text = languages[indexPath.row]
        cell.backgroundColor = .clear
        
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
    

}
