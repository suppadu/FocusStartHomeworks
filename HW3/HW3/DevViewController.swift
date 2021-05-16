//
//  DevViewController.swift
//  HW3
//
//  Created by Дмитрий Константинов on 05.05.2021.
//

import UIKit

class DevViewController: UIViewController {
    
    let devInfoArray = ["Увлекся компами и в целом технологиями после того как смог разогнать первый комп для запуска GTA:SA",
                        "Первое андроид-приложение написал в 16",
                        "Да, фантазии для более креативного использования свичей не хватило😅",
                        "А это 3 в двоичной системе"]
    
    let devLabel = UILabel()
    let switch1 = UISwitch()
    let switch2 = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .brown
        
        
        devLabel.translatesAutoresizingMaskIntoConstraints = false
        devLabel.text = devInfoArray[0]
        devLabel.backgroundColor = .yellow
        devLabel.numberOfLines = 0
        devLabel.sizeToFit()
        self.view.addSubview(devLabel)
        devLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50).isActive = true
        devLabel.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9).isActive = true
        devLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        devLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        switch1.accessibilityIdentifier = "1"
        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch1.setOn(false, animated: false)
        self.view.addSubview(switch1)
        switch1.topAnchor.constraint(equalTo: devLabel.bottomAnchor, constant: 10).isActive = true
        switch1.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        switch1.addTarget(self, action: #selector(switchLabel), for: .valueChanged)
        
        switch2.accessibilityIdentifier = "2"
        switch2.translatesAutoresizingMaskIntoConstraints = false
        switch2.setOn(false, animated: false)
        self.view.addSubview(switch2)
        switch2.topAnchor.constraint(equalTo: devLabel.bottomAnchor, constant: 10).isActive = true
        switch2.rightAnchor.constraint(equalTo: devLabel.rightAnchor).isActive = true
        switch2.addTarget(self, action: #selector(switchLabel), for: .valueChanged)
    }
    
    @objc func switchLabel(){
        let sw1On = switch1.isOn
        let sw2On = switch2.isOn
        
        if sw1On
        {
            if sw2On
            {
                devLabel.text = devInfoArray[3]
            }
            else
            {
                devLabel.text = devInfoArray[2]
            }
        }
        else
        {
            if sw2On
            {
                devLabel.text = devInfoArray[1]
            }
            else
            {
                devLabel.text = devInfoArray[0]
            }
        }
    }
}
