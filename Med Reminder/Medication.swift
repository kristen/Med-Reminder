//
//  Medication.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/26/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import Foundation
import CoreData

class Medication: NSManagedObject {    
    class func createAndFetch(name: String, in context: NSManagedObjectContext) -> Medication {
        let med = Medication(context: context)
        med.name = name
        try? context.save()
        return med
    }
    
}
