//
//  2.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 17/06/2022.
//

import Foundation
import UIKit

class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
    
}
