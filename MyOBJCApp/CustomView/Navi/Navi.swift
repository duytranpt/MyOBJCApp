//
//  Navi.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 17/06/2022.
//

import UIKit

@IBDesignable
class Navi: UIView {
    
    var nibNames = "Navi"
    var view: UIView!
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var naviTitle: UILabel!
    
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
        
        logoutBtn.isHidden = true
        addSubview(view)
        
        let firstColor =  UIColor(red: 45/255, green: 103/255, blue: 130/255, alpha: 1.0).cgColor

        let secondColor = UIColor(red: 2/255, green: 57/255, blue: 91/255, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = view.frame
        self.contentView.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibNames, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
}

