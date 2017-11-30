//
//  AddMedViewController.swift
//  Med Reminder
//
//  Created by Kristen Sundquist on 11/26/17.
//  Copyright © 2017 Kristen Sundquist. All rights reserved.
//

import UIKit

class AddMedViewController: UIViewController {

    @IBOutlet weak var medNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let name = self.medNameTextField.text, let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            _ = Medication.createAndFetch(name: name, in: context)
        }
       self.closeModal()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.closeModal()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
