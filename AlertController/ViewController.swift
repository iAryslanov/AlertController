//
//  ViewController.swift
//  AlertController
//
//  Created by Igor Aryslanov on 27.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showAction() {
        let alert = UIAlertController(title: "Photo Access", message: "Do you allow to use your photos?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet() {
        
        enum Films: String {
            case film1 = "Harry Potter"
            case film2 = "Forrest Gump"
            case film3 = "Peaceful Warrior"
            case cancelAction = "Cancel"
        }
        
        let alert = UIAlertController(title: nil, message: "Choose film", preferredStyle: .actionSheet)
        
        let handler: (_ type: Films) -> (UIAlertAction) -> Void =
        { type in
            return { action in
                print(type.rawValue)
            }
        }
        
        let film1 = UIAlertAction(title: Films.film1.rawValue, style: .default, handler: handler(.film1))
        alert.addAction(film1)
        
        let film2 = UIAlertAction(title: Films.film2.rawValue, style: .default, handler: handler(.film2))
        alert.addAction(film2)
        
        let film3 = UIAlertAction(title: Films.film3.rawValue, style: .destructive, handler: handler(.film3))
        alert.addAction(film3)
        
        let cancelAction = UIAlertAction(title: Films.cancelAction.rawValue, style: .cancel, handler: handler(.cancelAction))
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

