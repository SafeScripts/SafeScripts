//
//  ReminderViewController.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
 
    let prescriptionName = UITextField()
    let prescriptionDescription = UITextField()
    let timePicker = UIDatePicker()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(gesture)
        
        view.addSubview(prescriptionName)
        prescriptionName.clipsToBounds = true
        prescriptionName.layer.borderWidth = 1.0
        prescriptionName.layer.borderColor = UIColor.black.cgColor
        view.addSubview(prescriptionDescription)
        prescriptionDescription.clipsToBounds = true
        prescriptionDescription.layer.borderWidth = 1.0
        prescriptionDescription.layer.borderColor = UIColor.black.cgColor
        view.addSubview(timePicker)
        
        timePicker.datePickerMode = .time
        timePicker.clipsToBounds = true
    }
    
    @objc private func tapped() {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeThatFits(size: view.bounds.size)
    }
    
    public func sizeThatFits(size: CGSize) {
        var prescriptionNameFrame = CGRect.zero
        var prescriptionDescriptionFrame = CGRect.zero
        var pickerFrame = CGRect.zero
        
        prescriptionNameFrame.origin.x = 12
        prescriptionNameFrame.origin.y = 12 + view.safeAreaInsets.top
        prescriptionNameFrame.size.width = size.width - 2 * 12
        prescriptionNameFrame.size.height = 40
        
        prescriptionDescriptionFrame.origin.x = 12
        prescriptionDescriptionFrame.origin.y = prescriptionNameFrame.maxY + 12
        prescriptionDescriptionFrame.size.width = size.width - 2 * 12
        prescriptionDescriptionFrame.size.height = 40
        
        pickerFrame.size.width = size.width
        pickerFrame.size.height = 100
        pickerFrame.origin.y = prescriptionDescriptionFrame.maxY + 24
        pickerFrame.origin.x = 12
        
        prescriptionName.frame = prescriptionNameFrame
        prescriptionDescription.frame = prescriptionDescriptionFrame
        timePicker.frame = pickerFrame
    }
}
