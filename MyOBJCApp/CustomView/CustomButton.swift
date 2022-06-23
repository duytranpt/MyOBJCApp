//
//  CustomButton.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 09/06/2022.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var backgrColor: UIColor = .red {
        didSet {
            self.layer.backgroundColor = backgrColor.cgColor
        }
    }
    
    @IBInspectable var boderWith: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = boderWith
        }
    }
    
    @IBInspectable var boderWithColor: UIColor = .black {
        didSet {
            self.layer.borderColor = boderWithColor.cgColor
        }
    }
    

    
}
