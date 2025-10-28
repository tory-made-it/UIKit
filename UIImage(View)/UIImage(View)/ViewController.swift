//
//  ViewController.swift
//  UIImage(View)
//
//  Created by Владелец on 28.03.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cube: UIImageView!
    
    var imaga = UIImageView()
    let icyImage = UIImage(named: "icy")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Rubic's Cube
        cube.layer.borderWidth = 4
        cube.layer.borderColor = UIColor.blue.cgColor
        cube.layer.cornerRadius = 10
        
        //MARK: Winter Tail
        imaga.image = icyImage
        imaga.frame = CGRect(x: view.center.x - 150, y: 500, width: 300, height: 200)
        view.addSubview(imaga)
        imaga.layer.borderWidth = 4
        imaga.layer.cornerRadius = 10
        imaga.clipsToBounds = true
        
    }


}

