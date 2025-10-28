//
//  ViewController.swift
//  UIBarButtonItem
//
//  Created by Владелец on 22.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let items = ["up", "down"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLmageLogo()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addTapped))
        
    
        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
        
        title = "View Controller"
        let segmentContrioller = UISegmentedControl(items: items)
        segmentContrioller.isMomentary = true
        segmentContrioller.addTarget(self, action: #selector(segmenter), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentContrioller)
    }
        //MARK: Methods
    fileprivate func createLmageLogo() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        // Image without scaling
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "apple")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
    
//    @objc func addTapped() {
//        print("addTapped")
//    }

    @objc func switchTapped(param: UISwitch) {
        if param.isOn {
            print("Switch is on")
        } else {
            print("Shut down!")
        }
    }
    
    @objc func segmenter(param:UISegmentedControl) {
        let index = param.selectedSegmentIndex
        print(items[index])
        }
    

}

