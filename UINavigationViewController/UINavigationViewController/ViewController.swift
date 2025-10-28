//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by Владелец on 21.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var displaySecondButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstVC"
        
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
        view.addSubview(displaySecondButton)
    }
    
    @objc func performDisplaySecondVC(param: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
    }

}

