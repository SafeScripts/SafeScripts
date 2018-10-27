//
//  PillBoxReminderViewModel.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import Foundation

enum PillDays: CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

public class PillBoxReminderViewModel {
    
    let pillboxIdentifier: String = "Identifer"
    let medicationName: String = "Medication Name"
    var pillBoxDay: [PillDays] = []
    
    init() {
        
    }
    
}
