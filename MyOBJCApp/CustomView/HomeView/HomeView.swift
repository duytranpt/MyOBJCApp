//
//  HomeView.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 21/06/2022.
//

import UIKit

@IBDesignable
class HomeView: UIView {
    
    
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
    
    @IBOutlet weak var view1: ViewForMP!
    @IBOutlet weak var view2: ViewForMP!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var category: UILabel!
    
    var nibName = "HomeView"
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
        setupView()
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func setupView() {
        category.textColor = UIColor(named: "numberColor")
        category.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        line.alpha = 0.15
    }
    
}
