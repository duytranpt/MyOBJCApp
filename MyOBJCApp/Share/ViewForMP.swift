//
//  ViewForMP.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 10/06/2022.
//

import UIKit

@IBDesignable
class ViewForMP: UIView {
    
    var nibNames = "ViewForMP"
    var view: UIView!
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
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
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: Self.self)
        let nibb = UINib(nibName: nibNames, bundle: bundle)
        let view = nibb.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
}
