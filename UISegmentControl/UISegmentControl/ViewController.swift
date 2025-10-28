//
//  ViewController.swift
//  UISegmentControl
//
//  Created by Владелец on 18.03.2025.
//

import UIKit

class ViewController: UIViewController {

    var segmented = UISegmentedControl()
    var menuItems = ["one","two","three"]
    
    var imageView = UIImageView()
    let imageArray = [UIImage(named: "1.jpg"),
                      UIImage(named: "2.jpg"),
                      UIImage(named: "3.jpg"),
                      UIImage(named: "4.png")]
    
    var label = UILabel()
    let nameArray = ["Pika-Star", "Pika-Fruit", "Pika-Flower"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image
        imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 400)
        view.addSubview(imageView)
        imageView.image = imageArray[3]
        
        label.frame = CGRect(x: 100, y: 550, width: 200, height: 30)
        label.text = "Choose picture"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        view.addSubview(label)
        
        segmented = UISegmentedControl(items: menuItems)
        segmented.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        view.addSubview(segmented)
        
        segmented.addTarget(self, action: #selector(picChanger), for: .valueChanged)
    }

    @objc func picChanger(target: UISegmentedControl) {
        if target == segmented {
            let segmentedIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentedIndex]
            label.text = nameArray[segmentedIndex]
        }
    }

}

