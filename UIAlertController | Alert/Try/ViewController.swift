//
//  ViewController.swift
//  Try
//
//  Created by Владелец on 14.03.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Labell: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func MyButton(_ sender: Any) {
        
        
//        let alertController = UIAlertController(title: "Error", message: "Ahtung!", preferredStyle: .actionSheet)
//        let action = UIAlertAction(title: "ok", style: .default) { (action) in
////            let text = alertController.textFields?.first?.text
////            print(text ?? "No text")
//        }
//        
////        alertController.addTextField(configurationHandler: nil)
//        
//        alertController.addAction(action)
//        self.present(alertController, animated: true, completion: nil)
        
        self.Labell.text = ""
        self.alert(title: "Выбор!", message: "Примите правильное решение", style: .alert)
    }
    
    //2
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.Labell.text! += (text?.text!)! + ("!")
        }
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

