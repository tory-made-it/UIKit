//
//  ViewController.swift
//  UILabel
//
//  Created by Владелец on 23.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let labelll = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let labelllFrame = CGRect(x: 0, y: 0, width: 200, height: 23)
        labelll.frame = labelllFrame
        labelll.text = "IOS 11 and Xcode 9"
        labelll.font = .boldSystemFont(ofSize: 17)
        labelll.center = view.center
        labelll.textAlignment = .center
        labelll.textColor = .black
        labelll.shadowColor = .lightGray
        labelll.shadowOffset = .init(width: 2, height: 2)
        view.addSubview(labelll)
    }


}

