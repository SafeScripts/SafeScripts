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

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func commonSetup() {
        tableView.register(ReminderCell.self, forCellReuseIdentifier: "reminderCell")
        tableView.delegate = self
        tableView.dataSource = self
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

