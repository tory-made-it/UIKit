//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Владелец on 31.03.2025.
//

import UIKit

//UICollisionBehavior - searching for collapses between objects
//UIGravityBehavior - adds gravity
//UIPushBehavior - for pushes
//UISnapBehavior - sticks view to some point

class ViewController: UIViewController {
    
//    let square = UIView() //1
    
//    var squares = [UIDynamicItem]() //2
//    var animator = UIDynamicAnimator()
    
    var square = UIView()
    var animator = UIDynamicAnimator()
    var push = UIPushBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSquare()
        createGestureRecognizer()
        createAniamtionAndBehavior()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //MARK: First
//        //Creation of the square
//        square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        square.center = view.center
//        square.backgroundColor = .green
//        view.addSubview(square)
//        
//        //Creation of the animator and the gravity
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [square])
//        animator.addBehavior(gravity)
        
        
        //MARK: Second
//        //View Creation
//        let numberOfView = 2
//        squares.reserveCapacity(numberOfView)
//        var colorsArray = [UIColor.red, UIColor.green]
//        var currentCenterPoint: CGPoint = view.center
//        let eachViewSize = CGSize(width: 50, height: 50)
//        
//        for counter in 0..<numberOfView {
//            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
//            newView.center = currentCenterPoint
//            newView.backgroundColor = colorsArray[counter]
//            currentCenterPoint.y += eachViewSize.height + 10
//            view.addSubview(newView)
//            squares.append(newView)
//        }
//        animator = UIDynamicAnimator(referenceView: view)
//        
//        //Gravity Creation
//        let gravity = UIGravityBehavior(items: squares)
//        animator.addBehavior(gravity)
//        
//        //Collisions Creation
//        let collision = UICollisionBehavior(items: squares)
//        collision.translatesReferenceBoundsIntoBoundary = true
//        
//        //Higher Ground
//        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
//        
//        collision.collisionDelegate = self
//
//        animator.addBehavior(collision)
    }

    func createSquare() {
        square.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        square.center = view.center
        square.layer.cornerRadius = square.bounds.size.height / 2
        square.backgroundColor = .blue
        view.addSubview(square)
    }
    
    //Gesture Creation
    func createGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapper))
        view.addGestureRecognizer(tap)
    }
    
    //Collisions Creation
    func createAniamtionAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        push = UIPushBehavior(items: [square], mode: .continuous)
        
        collision.addBoundary(withIdentifier: "bottom" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height))
        collision.addBoundary(withIdentifier: "up" as NSCopying, from: CGPoint(x: 0, y: 0), to: CGPoint(x: view.bounds.size.width, y: 0))
        collision.addBoundary(withIdentifier: "left" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height), to: CGPoint(x: 0, y: 0))
        collision.addBoundary(withIdentifier: "right" as NSCopying, from: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height), to: CGPoint(x: view.bounds.size.width, y: 0))

        let noRotation = UIDynamicItemBehavior(items: [square])
        noRotation.allowsRotation = false
        
        animator.addBehavior(noRotation)
        animator.addBehavior(collision)
        animator.addBehavior(push)
        
        collision.collisionDelegate = self
    }
    
    @objc func tapper(param: UITapGestureRecognizer){
        //Gettin an angle
        let tapPoint: CGPoint = param.location(in: view)
        let centerPoint: CGPoint = square.center
        let deltaX: CGFloat = tapPoint.x - centerPoint.x
        let deltaY: CGFloat = tapPoint.y - centerPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        push.angle = angle
        
        let distance: CGFloat = sqrt(pow(tapPoint.x - centerPoint.x, 2) + pow(tapPoint.y - centerPoint.y, 2))
        push.magnitude = distance / 2
    }
    
    
}

//extension ViewController: UICollisionBehaviorDelegate {
//    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: any UIDynamicItem, withBoundaryIdentifier identifier: (any NSCopying)?, at p: CGPoint) {
//        let identifier = identifier as? String ?? ""
//        let kBottomBoundary = "bottomBoundary"
//        if identifier == kBottomBoundary {
//            UIView.animate(withDuration: 1.0, animations: {
//                let view = item as? UIView
//                view?.backgroundColor = .red
//                view?.alpha = 0.0
//                view?.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }) { finished in
//                let view = item as? UIView
//                behavior.removeItem(item)
//                view?.removeFromSuperview()
//            }
//        }
//    }
//}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: any UIDynamicItem, withBoundaryIdentifier identifier: (any NSCopying)?, at p: CGPoint) {
        let identifier = identifier as? String ?? ""
        let kBottomBoundary = ["bottom", "up", "right", "left"]
        if kBottomBoundary.contains(identifier) {
            push.angle = -push.angle + CGFloat.random(in: -0.5..<0.5*CGFloat.pi)
        }
    }
}

