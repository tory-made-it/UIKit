//
//  ViewController.swift
//  UITextField
//
//  Created by Владелец on 24.03.2025.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //<- also IMPORTANT MOMENT
    
    var meinTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        
        //IMPORTANT MOMENT
        meinTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = 0
        }
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange), name: UITextField.textDidChangeNotification, object: nil)
        
//        meinTextField.becomeFirstResponder()
    }
    //MARK: CreateUI
    func createTextField() {
        meinTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        meinTextField.center = view.center
        view.addSubview(meinTextField)
        meinTextField.placeholder = "FFFFFF"
        meinTextField.textAlignment = .center
        meinTextField.borderStyle = .roundedRect
    }
    //MARK: Notification
//    @objc func textFieldTextDidChange(param: NSNotification) {
//        print("UITextFieldTextDidChange = \(param)")
//    }
    
    
    
    
    //MARK: Delegates
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("textFieldShouldBeginEditing = here I'am deciding if textField can begin editing")
//        return true
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textFieldDidBeginEditing = here I'm doing something when textField began editing")
//    }
//    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("textFieldShouldEndEditing = here I'm deciding if textField can end editing")
//        return true
//    }
//    
//    
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        print("textFieldDidEndEditing = here I'm doing something when textField ended editing")
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("textField = here I'm deciding if textField can change characters. For example, you typed \(string)")
//        return true
//    }
//    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print("textFieldShouldClear = here I'm deciding if textField can clear")
//        return true
//    }
//    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn = here I'm deciding if textField should return. Hide keyboard")
        if textField == meinTextField {
            meinTextField.resignFirstResponder()
        }
        return true
    }
}

