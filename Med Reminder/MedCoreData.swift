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
    
    
    
//    // Storing core data
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let context = appDelegate.persistentContainer.viewContext
//    //        let medication = NSEntityDescription.insertNewObject(forEntityName: "Medication", into: context)
//    //        medication.setValue("multivitamin", forKey: "name")
//    //        do {
//    //            try context.save()
//    //            print ("Saved")
//    //        } catch {
//    //            // Process error
//    //        }
//
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Medication")
//    request.returnsObjectsAsFaults = false
//    do {
//    let results = try context.fetch(request)
//    if results.count > 0 {
//    for result in results as! [NSManagedObject] {
//    if let med = result.value(forKey: "name") as? String {
//    // name
//    print (med)
//    }
//    }
//    }
//    } catch {
//    // Process error
//    }
//
//
    
    
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
}
