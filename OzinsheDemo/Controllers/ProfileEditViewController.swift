//
//  ProfileEditViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 25.02.2026.
//

import UIKit

class ProfileEditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let placeholders = ["Сіздің атыңыз", "Email", "Телефон", "Туылған күні"]
    let defaultValues = ["Айдар", "example@email.com", "+7 700 000 00 00", "01.01.2000"]
    let datePicker = UIDatePicker()
    let profileEditView = ProfileEditView()
    
    @objc func dateChange() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        if let cell = profileEditView.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? EditFieldCell {
            cell.textField.text = formatter.string(from: datePicker.date)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileEditView)
        
        profileEditView.tableView.dataSource = self
        profileEditView.tableView.delegate = self

        
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
        if indexPath.row == 3 {
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
            cell.textField.inputView = datePicker
            cell.textField.inputAccessoryView = createToolBar()
        }
        cell.title.text = placeholders[indexPath.row]
        cell.textField.text = defaultValues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        let flexspace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexspace, doneButton], animated: false)
        return toolBar
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
}
