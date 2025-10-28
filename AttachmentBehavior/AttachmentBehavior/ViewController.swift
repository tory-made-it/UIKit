//
//  ViewController.swift
//  AttachmentBehavior
//
//  Created by Владелец on 01.04.2025.
//

import UIKit

//UIAttachmentBehavior - binding
//UISnapBehavior - shot

class ViewController: UIViewController {
    
    var square = UIView()
    var animator = UIDynamicAnimator()
    
//    var anchor = UIView()
//    var togetherSquareAncher = UIView()
//    var attachmentBehavior: UIAttachmentBehavior?
    
    var snapBehavior: UISnapBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: First
//        createSquare()
//        createAnchor()
//        createRegistorGesture()
//        createAnimationAndBehavior()
        
        //MARK: Second
        createSquare()
        createAnimation()
        createGestureRecognizer()
    }
    //MARK: First
//    // Square Creation
//    func createSquare() {
//        square.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
//        square.center = view.center
//        square.backgroundColor = .systemGreen
//        view.addSubview(square)
//        
//        togetherSquareAncher = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
//        togetherSquareAncher.backgroundColor = .systemBrown
//        square.addSubview(togetherSquareAncher)
//    }
//    // View With Connection Point(Ancher)
//    func createAnchor() {
//        anchor = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
//        //anchor.center = view.center
//        anchor.backgroundColor = .red
//        view.addSubview(anchor)
//    }
//    //Gesture Registor Creation
//    func createRegistorGesture() {
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(fingerPort))
//        view.addGestureRecognizer(panGestureRecognizer)
//    }
//    //Collision Creation And Attachment
//    func createAnimationAndBehavior() {
//        animator = UIDynamicAnimator(referenceView: view)
//        let collision = UICollisionBehavior(items: [square])
//        collision.translatesReferenceBoundsIntoBoundary = true
//        attachmentBehavior = UIAttachmentBehavior(item: square, attachedToAnchor: anchor.center)
//        animator.addBehavior(collision)
//        animator.addBehavior(attachmentBehavior!)
//    }
//    //Selector's Method (find finger's touch, send red square there and connect with big one
//    @objc func fingerPort(param: UIPanGestureRecognizer) {
//        let tapPoint = param.location(in: view)
//        attachmentBehavior?.anchorPoint = tapPoint
//        anchor.center = tapPoint
//    }
    
    //MARK: Second
    func createGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tap)
    }
    func createSquare() {
        square.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        square.center = view.center
        square.backgroundColor = .green
        view.addSubview(square)
    }
    func createAnimation() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        snapBehavior = UISnapBehavior(item: square, snapTo: square.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
    }
    @objc func tap(param: UITapGestureRecognizer) {
        let tap = param.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: square, snapTo: tap)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
    }
}
