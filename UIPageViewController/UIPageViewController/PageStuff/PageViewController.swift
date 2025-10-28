//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Владелец on 31.03.2025.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var cars = [CarsHelper]()
    let bmw = UIImage(named: "bmw")
    let audi = UIImage(named: "audi")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        let firstCar = CarsHelper(name: "BMW", image: bmw!)
        let secondCar = CarsHelper(name: "Audi", image: audi!)
        cars.append(firstCar)
        cars.append(secondCar)
    }
    
    //MARK: Create VC
   lazy var arrayCarsVC: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    //MARK: Init PageViewCintroller
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        self.view.backgroundColor = .green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarsVC[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else {return nil}
        if let index = arrayCarsVC.index(of: viewController) {
            if index > 0 {
                return arrayCarsVC[index - 1]
            }
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else {return nil}
        if let index = arrayCarsVC.index(of: viewController) {
            if index < arrayCarsVC.count - 1 {
                return arrayCarsVC[index + 1]
            }
        }
        return nil
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayCarsVC.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}
