//
//  Medication.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/26/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import Foundation
import CoreData

class MedicationModel {
    var name: String
    var managedObject: NSManagedObject?
    
    init(name: String) {
        self.name = name
        
    }

    init(name: String, managedObject: NSManagedObject) {
        self.name = name
        self.managedObject = managedObject
    }

    static func fetchSavedData() -> [MedicationModel] {
        // loading core data
        var meds = [MedicationModel]()
        if let results = MedCoreData.fetch(entityName: "Medication") {
            for result in results {
                if let med = result.value(forKey: "name") as? String {
                    // name
                    print (med)
                    meds.append(MedicationModel(name: med, managedObject: result))
                }
            }
        }
        return meds
    }
    
    func save() {
        // Storing core data
        let medication = NSEntityDescription.insertNewObject(forEntityName: "Medication", into: MedCoreData.context)
        medication.setValue(self.name, forKey: "name")
        MedCoreData.save()
    }
}
