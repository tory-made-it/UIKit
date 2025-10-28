//
//  ViewController.swift
//  UITabBarController
//
//  Created by Владелец on 23.03.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First"
        
        
        
        view.backgroundColor = .green
        
        var tabBar = UITabBarItem()
        tabBar = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBar
    }


}

