//
//  MedTableViewCell.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/26/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import UIKit

class MedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var medicationLabel: UILabel!
    
    var medModel: Medication?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMedModel(medModel: Medication) {
        self.medModel = medModel
        self.medicationLabel.text = medModel.name
    }
    
}
