//
//  PillBoxReminderViewModel.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import Foundation

public struct PrescriptionReminder: Codable {
    let slot: Int
    let name: String
    let description: String
    let time: TimeInterval
    let frequency: String
    let active: Bool
    
    init(slot: Int,
         name: String,
         description: String,
         time: TimeInterval,
         frequency: String,
         active: Bool)
    {
       self.slot = slot
       self.name = name
       self.description = description
       self.time = time
       self.frequency = frequency
       self.active = active
    }
}

public class PillBoxReminderViewModel {
    
    let pillboxIdentifier: String
    let medicationName: String
    private let _timeOfDay: Date
    var timeOfDay: String {
        return formatter.string(from: _timeOfDay)
    }
    
    let formatter: DateFormatter
    
    init(reminder: PrescriptionReminder) {
        pillboxIdentifier = String(reminder.slot)
        medicationName = reminder.name
        _timeOfDay = Date(timeIntervalSince1970: reminder.time)
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
    }
    
}

