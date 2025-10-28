//
//  ViewController.swift
//  UISwitch
//
//  Created by Владелец on 15.03.2025.
//

import UIKit

class ViewController: UIViewController {

    let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = .orange
        self.button.setTitle("OK", for: .normal)
        self.button.setTitle("Button was pressed", for: .highlighted)
        
        
        self.view.addSubview(self.button)
        
        //Create swith
        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        self.view.addSubview(self.mySwitch)
        
        //on
        self.mySwitch.setOn(true, animated: true)
        
        //Check
        if self.mySwitch.isOn {
            print("Switch on")
        } else {
            print("We're off")
        }
        
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        
    //MARK: SecondSwitch
        
        self.mySwitch2.frame = CGRect.zero
        
        self.mySwitch2.center = self.view.center
        self.view.addSubview(self.mySwitch2)
        
        //off DOESN'T WORK
        self.mySwitch2.tintColor = UIColor.black
        
        //level
        self.mySwitch2.thumbTintColor = UIColor.red
        
        //on
        self.mySwitch2.onTintColor = UIColor.blue
        
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }

    @objc func switchChange(paramTarget: UISwitch) {
        print("param is equals ", paramTarget)
        
        if paramTarget.isOn {
            print("Switch on")
        } else {
            print("We're off")
        }
    }
    
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.button.isUserInteractionEnabled = false
        } else {
            self.button.isUserInteractionEnabled = true
        }
    }
    
}

