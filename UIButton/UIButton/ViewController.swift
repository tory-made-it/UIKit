//
//  ViewController.swift
//  UIButton
//
//  Created by Владелец on 25.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton = UIButton()
    var normalImage = UIImage(named: "pills")
    var highlightedImage = UIImage(named: "can")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        view.addSubview(myButton)
        
        myButton.clipsToBounds = true
        myButton.contentMode = .scaleToFill
        myButton.setBackgroundImage(normalImage, for: .normal)
        myButton.setBackgroundImage(highlightedImage, for: .highlighted)
    }

    @objc func buttonIsPressed(sender:UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender:UIButton) {
        print("Button Is Tapped")
    }
}

