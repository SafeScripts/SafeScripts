//
//  PillBoxEnums.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import Foundation

enum PillDays: String, CaseIterable {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}


public class Prescriptions {
    static let shared = Prescriptions()
    
    private(set) var prescriptions: [PrescriptionReminder] = []
    
    init() {
        //THE WRONG WAY TO DO THIS!!!!
            if let objects = UserDefaults.standard.value(forKey: Constants.prescriptions) as? Data {
                let decoder = JSONDecoder()
                if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [PrescriptionReminder] {
                    prescriptions = objectsDecoded
                }
            }
        }
    
    func terribleSave() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(prescriptions) {
            UserDefaults.standard.set(encoded, forKey: Constants.prescriptions)
        }
    }
    
    func addPrescription(_ script:PrescriptionReminder) {
        prescriptions.append(script)
        terribleSave()
        RequestManager.savePrescription(script)
    }
}

