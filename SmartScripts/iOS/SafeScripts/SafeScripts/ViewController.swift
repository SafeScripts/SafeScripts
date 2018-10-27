//
//  ViewController.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import UIKit
import CoreBluetooth

public struct Constants  {
    static let prescriptions = "com.safescripts.prescriptions"
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    let button = UIButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    public func commonSetup() {
        view.addSubview(tableView)
        tableView.register(ReminderCell.self, forCellReuseIdentifier: "reminderCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(button)
        button.setTitle("Add Reminder", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(addReminder), for: .touchUpInside)
    }

    
    @objc private func addReminder() {
        let viewController = ReminderViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    // MARK: Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeThatFits(size: view.bounds.size)
    }

    public func sizeThatFits(size: CGSize) {
        var tableViewFrame = CGRect.zero
        var buttonFrame = CGRect.zero
        
        tableViewFrame.origin.y = view.safeAreaInsets.top
        tableViewFrame.size.width = size.width
        tableViewFrame.size.height = size.height / 2
        
        buttonFrame.origin.x = 12
        buttonFrame.origin.y = tableViewFrame.maxY + 20
        buttonFrame.size = button.sizeThatFits(size)
        buttonFrame.size.width = buttonFrame.size.width + 24
        
        button.frame = buttonFrame
        tableView.frame = tableViewFrame
    }
    
    //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Reminders"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // We selected something, do something
    }
    
    // MARK: TableView Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return number of Sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows in section
        return Prescriptions.shared.prescriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell")
        if let cell = cell as? ReminderCell {
            let reminder = Prescriptions.shared.prescriptions[indexPath.item]
            let newViewModel = PillBoxReminderViewModel(reminder: reminder)
            cell.configureCell(viewModel: newViewModel)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

