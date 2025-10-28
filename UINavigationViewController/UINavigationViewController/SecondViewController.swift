//
//  SecondViewController.swift
//  UINavigationViewController
//
//  Created by Владелец on 22.03.2025.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second!"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        perform( #selector(goBack), with: nil, afterDelay: 3)
    }
    
    @objc func goBack() {
//        navigationController?.popViewController(animated: true)
        //Get current controllers array
        var currentControllersArray = navigationController?.viewControllers
        
        //Delete tha last controller
        currentControllersArray?.removeLast()
        
        //Set new result
        if let newController = currentControllersArray {
            navigationController?.viewControllers = newController
        }
    }

}
