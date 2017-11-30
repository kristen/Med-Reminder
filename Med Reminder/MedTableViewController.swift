//
//  CoreDataMedTableViewController.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/28/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import UIKit
import CoreData

class MedTableViewController: FetchedResultsTableViewController {
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
        didSet {
            self.updateUI()
        }
    }
    
    var fetchedResultsController: NSFetchedResultsController<Medication>?
    
    func updateUI() {
        if let context = container?.viewContext {
            let request: NSFetchRequest<Medication> = Medication.fetchRequest()
            request.sortDescriptors = []
            fetchedResultsController = NSFetchedResultsController<Medication>(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            fetchedResultsController?.delegate = self
            try? fetchedResultsController?.performFetch()
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MedTableViewCell", bundle: nil), forCellReuseIdentifier: "MedCell")
        
        self.updateUI()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedCell", for: indexPath) as! MedTableViewCell
        
        // Configure the cell...
        if let medModel = fetchedResultsController?.object(at: indexPath) {
            cell.setMedModel(medModel: medModel)
        }
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let managedObject = self.fetchedResultsController?.object(at: indexPath), let context = self.container?.viewContext {
                context.delete(managedObject)
                try? context.save()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}
