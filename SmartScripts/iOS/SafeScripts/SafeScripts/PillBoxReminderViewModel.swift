//
//  PillBoxReminderViewModel.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import Foundation

public struct PrescriptionReminder {
    let prescriptionName: String
    let prescriptionDescription: String
    let time: Date
}

public class PillBoxReminderViewModel {
    
    let pillboxIdentifier: String = "Identifer"
    let medicationName: String = "Medication Name"
    let timeOfDay: TimeInterval = 60 * 60 * 9
    
    init() {
        
    }
    
}
