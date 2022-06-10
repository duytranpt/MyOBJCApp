//
//  Profile.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 09/06/2022.
//

import UIKit

@IBDesignable
class Profile: UIView {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var profileID: UILabel!
    
    var nibNames = "Profile"
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
        
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.image = UIImage(named: "profileImg")
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: Self.self)
        let nibb = UINib(nibName: nibNames, bundle: bundle)
        let view = nibb.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
}
