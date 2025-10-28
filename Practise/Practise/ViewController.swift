//
//  ViewController.swift
//  Practise
//
//  Created by Владелец on 16.03.2025.
//

import UIKit


class ViewController: UIViewController {
    
    let myButton = UIButton()
    let recognizeLabel = UILabel()
    
    @IBOutlet weak var labelOne: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recognizeLabel.frame = CGRect(x: 0, y: 0, width: 389, height: 843)
        recognizeLabel.backgroundColor = .gray
        recognizeLabel.alpha = 0.5
        view.addSubview(recognizeLabel)
        
        self.labelOne.layer.cornerRadius = 20
        self.labelOne.layer.masksToBounds = true
        
        
        //Handle button
        self.myButton.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        self.myButton.backgroundColor = .systemGray
        self.myButton.setTitleColor(.red, for: .normal)
        self.myButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 25)
        self.myButton.setTitle("Get a secret", for: .normal)
        self.myButton.setTitle("You are a loser", for: .highlighted)
        self.view.addSubview(myButton)
        
        self.myButton.addTarget(self, action: #selector(laugh(target:)), for: .primaryActionTriggered)
    }
    
    @IBAction func MyButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Question", message: "Who will ride the boat?", preferredStyle: .alert)
        let action = UIAlertAction(title: "John", style: .default) {(action) in
            self.labelOne.text = "Man rules \u{1F60E}"
        }
        let activity = UIAlertAction(title: "Mary", style: .default) { (a) in
            self.labelOne.text = "Mary strikes!"
        }
        
        alertController.addAction(action)
        alertController.addAction(activity)
        
        self.present(alertController, animated: true)
    }
    
    @objc func laugh(target: UIButton) {
        print("HaHAHaHAHaHAHaHAHaHAHaHAHaHAHaHA")
    }
}
