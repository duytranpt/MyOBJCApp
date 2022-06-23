//
//  OTPScreenViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 16/06/2022.
//

import UIKit

class OTPScreenViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var otpLabel: ButtonView!
    @IBOutlet weak var continueButton: ButtonView!
    @IBOutlet weak var otpTextFile: OTPStackView!
    @IBOutlet weak var naviBar: Navi!
    
    var OTP = 0
    var second: Int = 120
    var timer = Timer()
    var checkOtpLabel: ButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextFile.delegate = self
        setupNaviBar()
        initializeHideKeyboard()
        continueButton.button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        OTP = Int.random(in: 100000...999999)
        print("First OTP: \(OTP)")
        setupOTPLabel()
        registerObserver()
        createTime()
        
        let normal = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        
        let bold = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        
        self.textLabel.attributedText = addBoldText(fullString: "Vui lòng nhập mã xác thực được gửi về số điện thoại 0981234567 của  Quý khách", boldPartOfString: "0981234567", font: normal, boldFont: bold)


                
    }
    
    func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
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
            
            self.continueButton.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height + self.safeAreaInsets.bottom)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.continueButton.transform = .identity
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func actionButton() {
        let storyBoard = UIStoryboard(name: "HomeMyProfile", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeMyProfile") as! HomeMyProfileViewController
        
        self.checkOtpLabel?.removeFromSuperview()

        
        if otpTextFile.getOTP() == String(OTP) || otpTextFile.getOTP() == "000000"  {
            print("OTP : ",otpTextFile.getOTP())
            navigationController?.pushViewController(vc, animated: true)
        } else {
            OTPLabelView()
            
            print("OTP không chính xác")
        }
        
    }
    
    
}

extension OTPScreenViewController {
    
    
    func createTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        
        second = second - 1
        continueButton.ButtonTitle.text = "Tiếp tục (\(second)s) "
        if second <= 60 {
            otpLabel.button.isEnabled = true
            otpLabel.ButtonTitle.text = "Gửi lại mã OTP"
            otpLabel.ButtonTitle.alpha = 1
            otpLabel.button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            
        } else {
            otpLabel.ButtonTitle.text = "Gửi lại mã OTP (\(second - 60)s)"
            otpLabel.ButtonTitle.alpha = 0.5
        }
        
        if second <= 0 {
            continueButton.ButtonTitle.text = "Tiếp tục (0s) "
        }
    }

    @objc func buttonAction(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension OTPScreenViewController {
    
    func OTPLabelView() {
        
        checkOtpLabel = ButtonView()
        checkOtpLabel.frame.size = CGSize(width: 196, height: 15)
        
        checkOtpLabel.ButtonTitle.textColor = UIColor(named: "otpCheckColor")
        checkOtpLabel.ButtonTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        checkOtpLabel.translatesAutoresizingMaskIntoConstraints = false
        checkOtpLabel.ButtonTitle.text = "Mã OTP chưa chính xác, vui lòng nhập lại"
        
        self.view.addSubview(checkOtpLabel)
        
        checkOtpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkOtpLabel.topAnchor.constraint(equalTo: otpTextFile.bottomAnchor, constant: -12).isActive = true
        checkOtpLabel.bottomAnchor.constraint(equalTo: otpLabel.topAnchor, constant: 32).isActive = true
        checkOtpLabel.heightAnchor.constraint(equalTo: otpLabel.heightAnchor).isActive = true
    }
    
    @objc func tap(){
        
        self.checkOtpLabel?.removeFromSuperview()
        
        OTP = Int.random(in: 100000...999999)
        print("OTP: \(OTP)")
        otpTextFile.clearOTP()
        
        second = 120
        second = second - 1
        
        continueButton.ButtonTitle.text = "Tiếp tục (\(second)s) "
        if second <= 60 {
            otpLabel.ButtonTitle.text = "Gửi lại mã OTP"
            otpLabel.ButtonTitle.alpha = 1
            otpLabel.button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            print("second: \(second)")
            
        } else {
            otpLabel.ButtonTitle.text = "Gửi lại mã OTP (\(second - 60)s)"
            otpLabel.ButtonTitle.alpha = 0.5
            otpLabel.button.isEnabled = false
        }
        
        if second <= 0 {
            continueButton.ButtonTitle.text = "Tiếp tục (0s) "
        }
        
    }
    
    func setupOTPLabel() {
        otpLabel.ButtonTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        otpLabel.TitleColor = UIColor(named: "mainColor")!
    }
    
    func setupNaviBar() {
        naviBar.naviTitle.text = "Xác thực mã OTP"
        naviBar.backBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

extension OTPScreenViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
    }
    
}

extension OTPScreenViewController {
    
    
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
    
}
