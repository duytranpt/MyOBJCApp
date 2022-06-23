//
//  ProfileViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 15/06/2022.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var naviBar: Navi!
    @IBOutlet weak var loginBtn: ButtonView!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var phoneNumberInputView: UIView!
    
    var checkPhoneNumber: ButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupNaviBar()
        phoneNumberInput.keyboardType = .numberPad
        initializeHideKeyboard()
        loginBtn.button.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        self.checkPhoneNumber?.removeFromSuperview()
        registerObserver()
        
        
        let normal = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        
        let bold = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        
        self.textLabel.attributedText = addBoldText(fullString: "Chúng tôi mong muốn mang đến cho Quý khách trải nghiệm khác biệt với Vietnam Airlines", boldPartOfString: "Vietnam Airlines", font: normal, boldFont: bold)


        
        
        
    }
    
    func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!,boldFont: UIFont!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
                
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        
        return boldString
    }
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.loginBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height + self.safeAreaInsets.bottom)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.loginBtn.transform = .identity
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func loginBtnAction() {
        var phoneNumber: String?
        print(phoneNumberInput.text)
        
        if phoneNumberInput.text == "" {
            self.checkPhoneNumber?.removeFromSuperview()
            alertPhoneNumber()
            checkPhoneNumber.ButtonTitle.text = "Vui lòng nhập số điện thoại"
        } else {
            phoneNumber = phoneNumberInput.text!.replacingOccurrences(of: " ", with: "")
            
            let slice = phoneNumber![phoneNumber!.startIndex..<phoneNumber!.index(phoneNumber!.startIndex, offsetBy: 3)]
            
            
            if slice == "+84"  {
                phoneNumber = phoneNumber!.replacingOccurrences(of: "+84", with: "0")
                print("phoneNumber: \(phoneNumber!)")
            }
            
            let firstNumber = phoneNumber![phoneNumber!.startIndex..<phoneNumber!.index(phoneNumber!.startIndex, offsetBy: 1)]
            
            if firstNumber == "0" {
                if phoneNumber?.count == 10 {
                    let storyBoard = UIStoryboard(name: "OTPScreen", bundle: nil)
                    let VC = storyBoard.instantiateViewController(withIdentifier: "OTPScreen") as! OTPScreenViewController
                    navigationController?.pushViewController(VC, animated: true)
                }
                
            } else {
                self.checkPhoneNumber?.removeFromSuperview()
                alertPhoneNumber()
                checkPhoneNumber.ButtonTitle.text = "Số điện thoại phải bắt đầu bằng số 0, xin vui lòng kiểm tra lại."
            }
            
                        
            if phoneNumber!.count < 10 || phoneNumberInput.text!.count < 10 {
                self.checkPhoneNumber?.removeFromSuperview()
                alertPhoneNumber()
                checkPhoneNumber.Title = "Vui lòng nhập đủ 10 số điện thoại khi đăng nhập."
            }

        }
        
    }
    
    func alertPhoneNumber() {
        
        checkPhoneNumber = ButtonView()
        checkPhoneNumber.frame.size = CGSize(width: 196, height: 15)
        
        checkPhoneNumber.ButtonTitle.textColor = UIColor(named: "otpCheckColor")
        checkPhoneNumber.ButtonTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        checkPhoneNumber.ButtonTitle.numberOfLines = 2
        checkPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(checkPhoneNumber)
        
        checkPhoneNumber.ButtonTitle.leftAnchor.constraint(equalTo: phoneNumberInputView.leftAnchor, constant: 0).isActive = true
        checkPhoneNumber.ButtonTitle.rightAnchor.constraint(equalTo: phoneNumberInputView.rightAnchor, constant: 0).isActive = true
        checkPhoneNumber.topAnchor.constraint(equalTo: phoneNumberInputView.bottomAnchor, constant: 10).isActive = true
    
    }
}

extension MyProfileViewController {
    func setupNaviBar() {
        naviBar.naviTitle.text = "My Profile"
        naviBar.backBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    @objc func buttonAction(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension MyProfileViewController {
    
    
    
    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets ?? .zero
        }
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets
        }
        
        return .zero
    }
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

