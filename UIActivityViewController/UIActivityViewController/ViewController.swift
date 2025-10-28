//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Владелец on 20.03.2025.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createButton()
        
        
    }
    //MARK: - Methods
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Enter text for share"
        textField.delegate = self // for return
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare.layer.cornerRadius = 10
        buttonShare.clipsToBounds = true
        buttonShare.backgroundColor = .lightGray
        buttonShare.setTitleColor(.black, for: .normal)
        buttonShare.frame = CGRect(x: 115, y: 350, width: 150, height: 40)
        buttonShare.setTitle( "Share", for: .normal)
        buttonShare.addTarget(self, action: #selector(shareText(paramSender: )), for: .touchUpInside)
        view.addSubview(buttonShare)
    }

    @objc func shareText(paramSender: Any) {
        let text = textField.text ?? ""
        
        guard !text.isEmpty else {
            let message = "Just write some text!"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(action)
            present(alertController, animated: true)
            return
        }
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nope"], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
    
    //MARK: - UITextFieldDelegate
    // return for clear space
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder( )
        
        return true
    }
}

