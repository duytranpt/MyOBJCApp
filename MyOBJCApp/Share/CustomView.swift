//
//  CustomView.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 08/06/2022.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var boderWith: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = boderWith
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    var nibName = "CustomView"
    var view: UIView!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var noperson: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        deleteBtn.setTitleColor(.red, for: .normal)
        // Make the view stretch with containing view
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        //            let bundle = NSBundle(forClass: self.dynamicType)
        let bundle = Bundle(for: Self.self)
        
        //            let nib = UINib(nibName: nibName, bundle: bundle)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func setText(fullname: String, dateOfBirth: String, sex: String, phoneNumber: String) {
        fullNameLabel.text = fullname
        dateOfBirthLabel.text = dateOfBirth
        sexLabel.text = sex
        phoneNumberLabel.text = phoneNumber
    }
    
}
