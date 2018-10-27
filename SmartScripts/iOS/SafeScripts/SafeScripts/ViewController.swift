//
//  ViewController.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        commonSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func commonSetup() {
        tableView.register(ReminderCell.self, forCellReuseIdentifier: "reminderCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeThatFits(size: view.bounds.size)
    }
    
    public func sizeThatFits(size: CGSize) {
        var tableViewFrame = CGRect.zero
        
        tableViewFrame.origin.y = view.safeAreaInsets.top
        tableViewFrame.size.width = size.width
        tableViewFrame.size.height = size.height / 2
        
        tableView.frame = tableViewFrame
    }
    
    //MARK: - TableView Delegate
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell")
        if let cell = cell as? ReminderCell {
            let newViewModel = PillBoxReminderViewModel()
            cell.configureCell(viewModel: newViewModel)
            cell.sizeThatFits(view.bounds.size)
        }
        
        return cell ?? UITableViewCell()
    }
    
}

