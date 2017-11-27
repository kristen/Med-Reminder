//
//  MedCoreData.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/26/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import UIKit
import CoreData

class MedCoreData {
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    static func fetch(entityName: String) -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        let results = try? MedCoreData.context.fetch(request)
        return results as? [NSManagedObject]
    }
    
    static func save() {
        do {
            try context.save()
            print ("Saved")
        } catch {
            // Process error
        }
    }
}
