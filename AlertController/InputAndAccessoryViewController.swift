//
//  File.swift
//  AlertController
//
//  Created by Igor Aryslanov on 31.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class InputAndAccessoryViewController: UIViewController {
    
    let kind = ["Run", "Swim", "Bike", "Technical", "General Physical Preparation", "Climbing Wall"]
    
    @IBOutlet weak var dateTextField: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var kindTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        createKindPickerView()
    }
    
    func createDatePicker() {
        
        // Assign date picker to the text field.
        dateTextField.inputView = datePicker
        dateTextField.textAlignment = .center
        datePicker.datePickerMode = .date
        
//        datePicker.locale = Locale(identifier: "ru_RU")
        
//        let localeID =  Locale.preferredLanguages.first
//        datePicker.locale = Locale(identifier: localeID!)
        
        datePicker.locale = Locale(identifier: Locale.preferredLanguages.first!)
        
        // Toolbar.
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Bar button.
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dateDonePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        doneButton.style = .plain
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        
        // Assign toolbar.
//        dateTextField.inputAccessoryView = toolbar
        
        // Config format of date.
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd MMMM yyyy"
        
        dateTextField.text = formatter.string(from: datePicker.date)
        
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        let minDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())
        let maxDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func dateDonePressed() {
//        getDateFromPicker()
        self.view.endEditing(true)
    }
    
    @objc
    func dateChanged() {
        getDateFromPicker()
    }
    
    @objc
    func tapGestureDone() {
        view.endEditing(true)
    }
    
    // Config format of date.
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd MMMM yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
    }
    
    func createKindPickerView() {
        kindTextField.placeholder = "Touch me"
        
        let kindPickerView = UIPickerView()
        kindPickerView.delegate = self
        
        
        // Toolbar.
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Bar buttons.
        let upButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(kinkDonePressed))
        doneButton.style = .plain
        toolbar.setItems([upButton, flexSpace, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        // Assign toolbar.
        kindTextField.inputAccessoryView = toolbar
        
        // Assign picker view to the text field.
        kindTextField.inputView = kindPickerView
        
        kindTextField.textAlignment = .center
        
        // Customisation.
        kindPickerView.backgroundColor = #colorLiteral(red: 0.9384179711, green: 0.8951074481, blue: 0, alpha: 1)
        toolbar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolbar.barTintColor = #colorLiteral(red: 0.7257012725, green: 0.9211067557, blue: 0.01012825035, alpha: 1)
        
    }
    
    @objc
    func kinkDonePressed() {
        view.endEditing(true)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true) // Dismiss the date picker.
//    }
}

extension InputAndAccessoryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Picker View Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        kind.count
    }
    
    // MARK: Picker View Delegate -
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kind[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "Noteworthy", size: 20)
        pickerViewLabel.text = kind[row]
        
        return pickerViewLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        kindTextField.text = kind[row]
    }
}



