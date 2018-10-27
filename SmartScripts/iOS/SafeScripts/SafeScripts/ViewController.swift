//
//  ViewController.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .blue
        view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
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
}

