//
//  ViewController.swift
//  UIScrollView
//
//  Created by Владелец on 28.03.2025.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scroller = UIScrollView()
//    var imaga = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        createScrollView()
        
        let firstSeaImage = UIImage(named: "sea1")
        let secondSeaImage = UIImage(named: "sea2")
        let thirdSeaImage = UIImage(named: "sea3")
        
        let scrollViewRect = view.bounds
        
        //Scroll Creation
        scroller = UIScrollView(frame:scrollViewRect)
        //Convenient scrolling
        scroller.isPagingEnabled = true
        scroller.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        view.addSubview(scroller)
        
        //ImageViews Creation
        var imageViewRect = view.bounds
        let firstSeaImageView = newImage(paramImage: firstSeaImage!, paramFrame: imageViewRect)
        scroller.addSubview(firstSeaImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let secondSeaImageView = newImage(paramImage: secondSeaImage!, paramFrame: imageViewRect)
        scroller.addSubview(secondSeaImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let thirdSeaImageView = newImage(paramImage: thirdSeaImage!, paramFrame: imageViewRect)
        scroller.addSubview(thirdSeaImageView)
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("Start of the scrolling")
//        print(scrollView.contentOffset.y)
//        scroller.alpha = 0.5
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("End of it")
//        scroller.alpha = 1
//    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("Guarantee that the end will return alpha to 1")
//        scroller.alpha = 1
//    }
    
    
    
//    func createScrollView() {
//        scroller.indicatorStyle = .white
//        let imageToLoad = UIImage(named: "sea1")
//        imaga = UIImageView(image: imageToLoad)
//        scroller = UIScrollView(frame: view.bounds)
//        scroller.addSubview(imaga)
//        scroller.contentSize = imaga.bounds.size
//        view.addSubview(scroller)
//        
//        scroller.delegate = self
//    }

    func newImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }

}

