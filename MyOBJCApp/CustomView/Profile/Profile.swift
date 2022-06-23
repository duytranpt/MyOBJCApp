//
//  Profile.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 17/06/2022.
//

import UIKit

@IBDesignable
class Profile: UIView {
    var nibNames = "Profile"
    var view: UIView!

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var profileID: UILabel!
    
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

        avatarImg.image = UIImage(named: "componantAvatarProfile")
        avatarImg.layer.cornerRadius = avatarImg.frame.width/2
        phoneNumber.text = "0987567765"
        displayName.text = "---"
        profileID.text = "My Profile ID: 123456789"
        profileID.textColor = UIColor(named: "mainColor")
        addSubview(view)
        
        setupTitle()
    }
        
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibNames, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }

    func setupTitle() {
        profileID.textColor = UIColor(named: "mainColor")
        profileID.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        phoneNumber.textColor = UIColor(named: "textColor")
        phoneNumber.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        displayName.textColor = UIColor(named: "numberColor")
        displayName.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
    }

}


