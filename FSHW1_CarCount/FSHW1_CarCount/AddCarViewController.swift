//
//  AddCarViewController.swift
//  FSHW1_CarCount
//
//  Created by Дмитрий Константинов on 18.04.2021.
//

import UIKit

class AddCarViewController: UIViewController
{
    @IBOutlet weak var manufactureTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    var pickerView = UIPickerView()
    
    var newCar: Car? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        bodyTextField.inputView = pickerView
        
        manufactureTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        modelTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bodyTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        manufactureTextField.placeholder = "Марка"
        modelTextField.placeholder = "Модель"
        bodyTextField.placeholder = "Кузов"
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        if manufactureTextField.text?.isEmpty ?? false ||
            modelTextField.text?.isEmpty ?? false ||
            bodyTextField.text?.isEmpty ?? false
        {
            manufactureTextField.backgroundColor = #colorLiteral(red: 0.9452585548, green: 0.1414019937, blue: 0.008166829285, alpha: 1)
            modelTextField.backgroundColor = #colorLiteral(red: 0.9452585548, green: 0.1414019937, blue: 0.008166829285, alpha: 1)
            bodyTextField.backgroundColor = #colorLiteral(red: 0.9452585548, green: 0.1414019937, blue: 0.008166829285, alpha: 1)
            
            manufactureTextField.placeholder = "Обязательное поле"
            modelTextField.placeholder = "Обязательное поле"
            bodyTextField.placeholder = "Обязательное поле"
            return false
        }
        else
        {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        newCar = Car(manufacturer: manufactureTextField.text ?? "Ошибка",
                         model: modelTextField.text ?? "Ошибка",
                         body: Car.Body.init(rawValue: bodyTextField.text!) ?? Car.Body.SUV,
                         yearOfIssue: Int(yearTextField.text ?? "-1") ?? -1,
                         carNumber: numberTextField.text ?? "-")
        print(newCar!)
    }

}

extension AddCarViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Car.Body.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bodyTextField.text = Car.Body.SUV.rawValue
        return Car.Body.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bodyTextField.text = Car.Body.allCases[row].rawValue
    }
    
}
