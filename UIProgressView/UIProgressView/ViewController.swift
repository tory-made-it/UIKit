//
//  ViewController.swift
//  UIProgressView
//
//  Created by Владелец on 30.03.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private var myProgress = UIProgressView()
    private var myButton = UIButton()
    private var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createProgress(myProgress)
        createButton(myButton)
        createTimer(&myTimer)
    }

    private func createProgress(_ progressView: UIProgressView) {
        progressView.frame = CGRect(x: view.center.x - 75, y: view.center.y, width: 150, height: 50)
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: true)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 4, y: view.center.y / 2, width: 150, height: 100)
        button.backgroundColor = .systemYellow
        button.setTitle("YOU'RE DUMB", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size:20)
        button.alpha = 0.5
        view.addSubview(button)
//        button.addTarget(self, action: #selector(refresher), for: .touchUpInside)
    }
    
    //MARK: Timer
    private func createTimer(_ timer: inout Timer) {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                         selector: #selector(updateProgress),
                                     userInfo: nil, repeats: true)
    }

    //MARK: Selectors
    @objc func updateProgress() {
        if myProgress.progress != 1.0 {
            myProgress.progress += 0.1
        } else if myProgress.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("Let's Goo", for: .normal)
                self.myButton.setTitleColor(.black, for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    //MARK: Непонятка
//    @objc func refresher(pref: UIButton) {
//        self.myButton.alpha = 0.5
//        self.myButton.setTitleColor(.systemYellow, for: .normal)
//        self.myProgress.progress = 0.0
//        self.myTimer = Timer.scheduledTimer(timeInterval: 1,
//                                                    target: self,
//                                                       selector: #selector(updateProgress),
//                                                    userInfo: nil, repeats: true)
//    }
}

