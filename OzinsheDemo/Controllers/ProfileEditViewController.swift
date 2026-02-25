//
//  ProfileEditViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 25.02.2026.
//

import UIKit

class ProfileEditViewController: UIViewController, UITableViewDataSource {
    
    let placeholders = ["Сіздің атыңыз", "Email", "Телефон", "Туылған күні"]
    
    let profileEditView = ProfileEditView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileEditView)
        
        profileEditView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return placeholders.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditFieldCell
        cell.textField.placeholder = placeholders[indexPath.row]
        return cell
    }
}
