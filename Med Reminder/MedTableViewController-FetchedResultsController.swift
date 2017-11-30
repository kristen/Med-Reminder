//
//  CoreDataMedTableViewController-FetchedResultsController.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/28/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import UIKit

extension MedTableViewController {

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let sections = fetchedResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
}
