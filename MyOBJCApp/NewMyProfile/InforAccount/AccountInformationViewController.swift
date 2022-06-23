//
//  AccountInformationViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 21/06/2022.
//

import UIKit

class AccountInformationViewController: UIViewController {

    @IBOutlet weak var naviBar: Navi!
    @IBOutlet weak var checkBox: ButtonView!
    @IBOutlet weak var cancelBtn: ButtonView!
    @IBOutlet weak var confirm: ButtonView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavi()
        setupCheckBox()
        setupButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        setupTextLabel()
        
    }
   
    func setupTextLabel() {
        let normal = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        let bold = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
       
        textLabel.numberOfLines = 0
        textLabel.textColor = UIColor(named: "textColor")
        self.textLabel.attributedText = addBoldText(fullString: "Bằng việc bấm Cập nhật, Tôi đã đọc và đồng ý với chính sách bảo mật thông tin, quyền riêng tư của Vietnam Airline", boldPartOfString: "chính sách bảo mật thông tin, quyền riêng tư", font: normal, boldFont: bold, color: UIColor(named: "mainColor"))
        
        
    }
}

extension AccountInformationViewController {
    
    func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!,boldFont: UIFont!, color: UIColor!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
                
        let colorAttribute = [NSAttributedString.Key.foregroundColor: color!]
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        boldString.addAttributes(colorAttribute, range: fullString.range(of: boldPartOfString as String))
        boldString.addAttributes(underlineAttribute, range: fullString.range(of: boldPartOfString as String))
        
        return boldString
    }
    
    func setupNavi() {
        naviBar.naviTitle.text = "Thông tin tài khoản"
        
        naviBar.backBtn.isHidden = true
        naviBar.backBtn.isEnabled = true
        
        naviBar.logoutBtn.isHidden = true
    }
    
    func setupCheckBox() {
        checkBox.button.addTarget(self, action: #selector(checked), for: .touchUpInside)
        
    }
    
    @objc func checked() {
        
        let isOpen = checkBox.bool
        checkBox.bool = !isOpen
       
        if isOpen {
            checkBox.backgrColor = .white
            checkBox.boderWith = 1
            checkBox.boderWithColor = UIColor(named: "textColor")!
            checkBox.button.setImage(nil, for: .normal)

        } else {
            
            checkBox.boderWith = 0
            checkBox.backgrColor = UIColor(named: "mainColor")!
            checkBox.button.setImage(UIImage(named: "path2"), for: .normal)


        }
   
    }
    
    func setupButton() {
        cancelBtn.button.tag = 1
        cancelBtn.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        confirm.button.tag = 2
        confirm.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(button: UIButton) {
        switch button.tag {
        case 1:
            navigationController?.popViewController(animated: true)
            break
        case 2:
            navigationController?.popViewController(animated: true)
            break
        default:
            break
        }
    }

}
