//
//  ButtonView.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 17/06/2022.
//

import UIKit

@IBDesignable
class ButtonView: UIView {
    
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
    
    @IBInspectable var TitleColor: UIColor = .black {
        didSet {
            self.ButtonTitle.textColor = TitleColor
        }
    }

    @IBInspectable var Title: String = "" {
        didSet {
            self.ButtonTitle.text = Title
        }
    }

    
    var nibName = "ButtonView"
    var view: UIView!
    var bool: Bool = false
    
    @IBOutlet weak var ButtonTitle: UILabel!
    @IBOutlet weak var button: UIButton!
    
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
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        button.backgroundColor = .clear
        view.backgroundColor = .clear
        setupTitle()
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
     
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func setupTitle() {
        ButtonTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
    }
    
}
