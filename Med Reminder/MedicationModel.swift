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

    init(name: String) {
        self.name = name
    }

    static func fetchSavedData() -> [MedicationModel] {
        // loading core data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Medication")
        request.returnsObjectsAsFaults = false
        var meds = [MedicationModel]()
        do {
            let results = try MedCoreData.context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let med = result.value(forKey: "name") as? String {
                        // name
                        print (med)
                        meds.append(MedicationModel(name: med))
                    }
                }
            }
        } catch {
        // Process error
        }
        return meds
    }
    
    func save() {
        // Storing core data
        let medication = NSEntityDescription.insertNewObject(forEntityName: "Medication", into: MedCoreData.context)
        medication.setValue(self.name, forKey: "name")
        do {
            try MedCoreData.context.save()
            print ("Saved")
        } catch {
            // Process error
        }
    }
}
