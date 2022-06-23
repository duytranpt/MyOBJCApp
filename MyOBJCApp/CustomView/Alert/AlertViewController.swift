//
//  AlertViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 13/06/2022.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var titleAlert: UILabel!
    @IBOutlet weak var messageAlert: UILabel!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var cancelButton: CustomButton!
    @IBOutlet weak var confirmButton: CustomButton!
    var TagButton = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        parentView.roundCorners([.topLeft, .topRight], radius: 10)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.59)
                        
    }
    

    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    
}

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}

