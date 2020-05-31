//
//  File.swift
//  AlertController
//
//  Created by Igor Aryslanov on 31.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class InputAndAccessoryViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var kindTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }
    
    func createDatePicker() {
        
        dateTextField.textAlignment = .center
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        // assign toolbar
        dateTextField.inputAccessoryView = toolbar
        
        // assign date picker to the text field
        dateTextField.inputView = datePicker
        
        // date picker mode
        datePicker.datePickerMode = .date
    }
    
    @objc
    func donePressed() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
