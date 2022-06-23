//
//  CustomTextfield.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 22/06/2022.
//

import UIKit

protocol CustomTextfieldDelegate {
    func menuDidAnimate(up: Bool)
    func optionSelected(option: String)
}

@IBDesignable
class CustomTextfield: UIView {

    @IBOutlet weak var line: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var content: UITextField!
    @IBOutlet weak var confirm: ButtonView!
    
    var nibName = "CustomTextfield"
    var view: UIView!
    
    
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
        view.backgroundColor = .clear
        setupUI()
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
     
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func setupUI() {
        title.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        title.textColor = UIColor(named: "textColor")
        
        content.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        content.textColor = UIColor(named: "numberColor")
        
        image.image = UIImage(named: "16X16ViewMore")
        
        confirm.ButtonTitle.text = "Xác thực"
        confirm.ButtonTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        confirm.ButtonTitle.textColor = UIColor(named: "mainColor")!
        confirm.boderWith = 1
        confirm.boderWithColor = UIColor(named: "mainColor")!
        confirm.cornerRadius = 8
        confirm.backgrColor = .white
        confirm.isHidden = true
        
        line.backgroundColor = UIColor(named: "textColor")?.withAlphaComponent(0.5)
        
    }
    
    func setTitle(Title: String!) {
        
        let normalFont = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        self.title.attributedText = formatTextTitle(fullString: Title! as NSString, boldPartOfString: "*", font: normalFont, color: UIColor.red)
    }
    
    func formatTextTitle(fullString: NSString, boldPartOfString: NSString, font: UIFont!, color: UIColor!) -> NSAttributedString {
        
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        
        let boldFontAttribute = [NSAttributedString.Key.foregroundColor:color!]
                
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        
        return boldString
    }


}


