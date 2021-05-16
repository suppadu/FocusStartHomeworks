//
//  ViewController.swift
//  HW3
//
//  Created by Дмитрий Константинов on 05.05.2021.
//

import UIKit
import SnapKit

class HobbyViewController: UIViewController {

    let button = UIButton()
    let label = UILabel()
    let text = """
Одно из моих хобби - это машины.
Чинить, тюнинговать, катать.
Эту домашку собственно сдаю так поздно, потому что помогал бате капиталить его грузовик.

Кнопку можно нажать, появится мудрость
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        button.setTitle("Touch", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(callMeTapped(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset((tabBarController?.tabBar.bounds.height ?? 100.0) * -1 - 10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-50)
            make.height.equalTo(46)
        }
        
        label.text = text
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.equalTo(button.snp.top).offset(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            make.width.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview().offset(self.view.bounds.width * -1)
        }
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.label.center.x += self.view.bounds.width
        }
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.label.center.x -= self.view.bounds.width
        }
    }
    
    @objc func callMeTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 250, height: 250))
        let photo = UIImage(named: "photo")
        imageView.image = photo
        alert.view.addSubview(imageView)
        alert.view.snp.makeConstraints { make in
            make.height.equalTo(315)
            make.width.equalTo(250)
        }
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

