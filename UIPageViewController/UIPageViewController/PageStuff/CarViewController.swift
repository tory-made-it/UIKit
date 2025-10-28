//
//  CarViewController.swift
//  UIPageViewController
//
//  Created by Владелец on 31.03.2025.
//

import UIKit

class CarViewController: UIViewController {

    //MARK: Image
    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        return view
    }()
    
    //MARK: Label
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Зачем здесь lazy???
    lazy var subView: [UIView] = [self.carImage, self.nameLabel]
    
    //MARK: Init
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemBlue
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        
        for view in subView { self.view.addSubview(view)}
        
        //MARK: Constraints
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
//            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
//            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
//            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//        ])
//        
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
//            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//        ])
        
        NSLayoutConstraint.activate([
            carImage.heightAnchor.constraint(equalToConstant: 250),
            carImage.widthAnchor.constraint(equalToConstant: 250),
            carImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            carImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: System init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
