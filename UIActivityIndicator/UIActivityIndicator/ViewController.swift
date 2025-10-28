//
//  ViewController.swift
//  UIActivityIndicator
//
//  Created by Владелец on 29.03.2025.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var web: UIWebView!
    
    @IBOutlet weak var back: UIBarButtonItem!
    
    @IBOutlet weak var forward: UIBarButtonItem!
    
    let application = UIApplication.shared //loading circle on the bar
    override func viewDidLoad() {
        super.viewDidLoad()
        web.delegate = self
        
        //MARK: PDF part
        if let pdfURL = Bundle.main.url(forResource: "example", withExtension: "pdf") {
            let request = URLRequest(url: pdfURL)
            web.loadRequest(request)
        }
        
        
        //MARK: Web Part
//        if let myURL = URL(string: "https://www.google.ru") {
//            let request = URLRequest(url: myURL)
//            web.loadRequest(request)
//        }
    }
    //MARK: UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Start load")
        back.isEnabled = false
        forward.isEnabled = false
        application.isNetworkActivityIndicatorVisible = true //loading circle
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Finish load")
        if web.canGoBack {
            back.isEnabled = true
        } else if web.canGoForward {
            forward.isEnabled = true
        }
        application.isNetworkActivityIndicatorVisible = false// still loading circle
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print(request)
        return true
    }
    
    
    
    
    //MARK: Actions
    @IBAction func backAction(_ sender: Any) {
        if web.canGoBack {
            web.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if web.canGoForward {
            web.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        web.reload()
    }
    

}

