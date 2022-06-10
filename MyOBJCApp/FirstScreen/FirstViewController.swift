//
//  FirstViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 07/06/2022.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tagOne: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        tagOne.setText(fullname: "Phạm Tuấn Anh", dateOfBirth: "15/01/1996", sex: "Nam", phoneNumber: "0988666888")
        
        
        
    }
   
}


