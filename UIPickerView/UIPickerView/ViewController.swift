//
//  ViewController.swift
//  UIPickerView
//
//  Created by Владелец on 17.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIPickerView()
    let pocker = UIDatePicker()
    let pokaker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: picker
        picker.center = view.center
        
        //Subscribtion on protocols
        picker.dataSource = self
        picker.delegate = self
        
        view.addSubview(picker)
        
        
        
        //MARK: pocker(DataPicker)
        pocker.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        
        //Style changer
        pocker.preferredDatePickerStyle = .wheels
        
        view.addSubview(pocker)
        
        //Mode changer(date)
        pocker.datePickerMode = .date
        
        //Constraints
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 3600
        
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYearFromToday = todayDate.addingTimeInterval(2 * oneYearTime)
        
        pocker.minimumDate = oneYearFromToday
        pocker.maximumDate = twoYearFromToday
        
        
        //Selected date printer
        pocker.addTarget(self, action: #selector(datePickerChange(paramDataPicker: )), for: .valueChanged)
        
        
        //MARK: pokaker(DatePicker)
        pokaker.frame = CGRect(x: 50, y: 600, width: 200, height: 50)
        view.addSubview(pokaker)
        
        //Mode changer(timer)
        pokaker.datePickerMode = .countDownTimer
        //Base setting
        pokaker.countDownDuration = 3 * 60
    }
    
    @objc func datePickerChange(paramDataPicker: UIDatePicker) {
        if paramDataPicker.isEqual(pocker) {
            print("dataChange = ", paramDataPicker.date)
        }
    }


}
//MARK: For picker
extension ViewController: UIPickerViewDataSource {
    //Bars
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Lines
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}
//Option's name
extension ViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        let result = "row = \(row)"
        return result
    }
}
