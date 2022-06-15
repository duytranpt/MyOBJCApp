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
        
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
       
        view.frame = bounds
        deleteBtn.setTitleColor(UIColor(named: "ink"), for: .normal)
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        addSubview(view)
    }
    
    @IBAction func tappde(_ sender: Any) {
        print("Hello")
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
