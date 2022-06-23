//
//  CustomTextFiel.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 16/06/2022.
//

import UIKit

class CustomTextFieldDemo: UITextField {

    var didEnterLastDigit: ((String) -> Void)?
    
    var defaultCharacter = "-"
    
    private var isConfigured = false
    
    private var digitLabels = [UILabel]()
    private var viewArr = [UIView]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        

        return recognizer
    }()
    
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
      
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
    }

    private func configureTextField() {
       
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    

    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1 ... count {
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 17, weight: .medium)
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            label.textColor = UIColor(named: "numberColor")
            digitLabels.append(label)

            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            let boderView = UIView()
            boderView.layer.cornerRadius = 8
            boderView.frame.size = CGSize(width: 32, height: 32)
            boderView.layer.borderWidth = 1
            boderView.layer.borderColor = UIColor(named: "ink100")?.cgColor
            viewArr.append(boderView)
            boderView.addSubview(label)
            boderView.isUserInteractionEnabled = true
            boderView.addGestureRecognizer(tap)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            boderView.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: boderView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: boderView.centerYAnchor).isActive = true
            
            stackView.addArrangedSubview(boderView)
        }
        
        
        
        return stackView
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        print("Hello World")
        sender.addTarget(self, action: #selector(becomeFirstResponder))
        if sender.view == viewArr.first {
//            sender.view?.isUserInteractionEnabled = true
            sender.view?.layer.borderColor = UIColor(named: "main900")?.cgColor
        }
        
    }
    
    @objc
    private func textDidChange() {

        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            let a = viewArr[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
                a.layer.borderColor = UIColor(named: "main900")?.cgColor

            } else {
                currentLabel.text = defaultCharacter
                a.layer.borderColor = UIColor(named: "ink100")?.cgColor
            }
            
            if i == 0 {

                a.layer.borderColor = UIColor(named: "main900")?.cgColor
            }

        }
        

        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
    
}

extension CustomTextFieldDemo: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}
