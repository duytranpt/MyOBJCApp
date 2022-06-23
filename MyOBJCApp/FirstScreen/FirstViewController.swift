//
//  FirstViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 14/06/2022.
//

import UIKit

class FirstViewController: UIViewController {

 
    @IBOutlet weak var gender: CustomTextfield!
    @IBOutlet weak var textField: CustomTextfield!
    
    
    var name: CustomTextfield!
    var lastName: CustomTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initializeHideKeyboard()
        textField.content.text = "Bà"
        textField.setTitle(Title: "Danh xưng*")
        
        gender.image.isHidden = true
        gender.content.isEnabled = false
        gender.setTitle(Title: "Giới tính*")
        
        switch textField.content.text {
        case "Ông":
            gender.content.text = "Nam"
            break
        case "Bà":
            gender.content.text = "Nữ"
            break
        default:
            gender.content.text = ""
            break
        }
        
        setupView()
        
      
    }
    
    func setupView() {
        
        
        name = CustomTextfield()
        name.setTitle(Title: "Tên đệm & Tên*")
        name.content.text = "Cao Duy"
        
        name.translatesAutoresizingMaskIntoConstraints = false
       
//        name.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        name.heightAnchor.constraint(equalToConstant: 59).isActive = true
        name.widthAnchor.constraint(equalToConstant: 150).isActive = true
            
        
        lastName = CustomTextfield()
        lastName.setTitle(Title: "Họ*")
        lastName.content.text = "Trần"

        lastName.translatesAutoresizingMaskIntoConstraints = false
       
//        lastName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        lastName.heightAnchor.constraint(equalToConstant: 59).isActive = true
        lastName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 0
        stackView.backgroundColor = .red

        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(lastName)
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 59).isActive = true
////        stackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 100).isActive = true
        
    }
  
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    

}


