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
    
    let saveButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(prescriptionName)
        prescriptionName.clipsToBounds = true
        prescriptionName.layer.borderWidth = 1.0
        prescriptionName.layer.borderColor = UIColor.black.cgColor
        view.addSubview(prescriptionDescription)
        prescriptionDescription.clipsToBounds = true
        prescriptionDescription.layer.borderWidth = 1.0
        prescriptionDescription.layer.borderColor = UIColor.black.cgColor
        view.addSubview(timePicker)
        
        saveButton.setTitle("Save Reminder", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.borderWidth = 1.0
        saveButton.layer.borderColor = UIColor.black.cgColor
        
        saveButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        timePicker.datePickerMode = .time
        timePicker.clipsToBounds = true
    }
    
    
    @objc private func tapped() {
        guard let text = prescriptionName.text, let description = prescriptionDescription.text else { return }
        let time = timePicker.date
        let reminder = PrescriptionReminder(slot: 1, name: text, description: description, time: time.timeIntervalSince1970, frequency: "daily", active: true)
        Prescriptions.shared.addPrescription(reminder)
        
        
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
        var saveButtonFrame = CGRect.zero
        
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
        
        saveButtonFrame.origin.x = 12
        saveButtonFrame.size.width = size.width - 24
        saveButtonFrame.size.height = 50
        saveButtonFrame.origin.y = size.height - saveButtonFrame.size.height - view.safeAreaInsets.bottom
        
        prescriptionName.frame = prescriptionNameFrame
        prescriptionDescription.frame = prescriptionDescriptionFrame
        timePicker.frame = pickerFrame
        saveButton.frame = saveButtonFrame
    }
}
