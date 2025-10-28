//
//  ViewController.swift
//  WKWebView
//
//  Created by Владелец on 29.03.2025.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var web = WKWebView()
    
    override func loadView() {
        web = WKWebView()
        web.navigationDelegate = self
        view = web
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myURL = URL(string: "https://www.google.ru") {
            let myRequest = URLRequest(url: myURL)
            web.load(myRequest)
            web.allowsBackForwardNavigationGestures = true
        }
    }


}

