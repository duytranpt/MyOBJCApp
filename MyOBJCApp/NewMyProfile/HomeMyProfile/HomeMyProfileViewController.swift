//
//  HomeMyProfileViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 17/06/2022.
//

import UIKit

class HomeMyProfileViewController: UIViewController {

    @IBOutlet weak var naviBar: Navi!
    @IBOutlet weak var profileView: Profile!
    @IBOutlet weak var person: HomeView!
    @IBOutlet weak var uitilities: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "main")
        setupProfileView()
        setupNaviBar()
        setupView()
    }
    
    
    

}

extension HomeMyProfileViewController {
    
    func setupProfileView() {
//        profileView.displayName.text = "Duy TC"
//        profileView.profileID.text = "My Profile ID: 123456789"
//        profileView.phoneNumber.text = "0987666888"
        
    }

    func setupView() {
        person.category.text = "Cá nhân"
        person.view1.title.text = "Thông tin tài khoản"
        person.view1.subTitle.text = "Chỉnh sửa, cập nhật thông tin tài khoản My Profile"
        person.view1.icon.image = UIImage(named: "group17830")
        person.view1.tapView.tag = 1
        person.view1.tapView.addTarget(self, action: #selector(selectView), for: .touchUpInside)
        
        person.view2.title.text = "Danh bạ hành khách bay"
        person.view2.subTitle.text = "Quản lý thông tin của người thân hoặc bạn bè…"
        person.view2.icon.image = UIImage(named: "group17831")
        person.view2.tapView.tag = 2
        person.view2.tapView.addTarget(self, action: #selector(selectView), for: .touchUpInside)
        
        uitilities.category.text = "Tiện ích"
        uitilities.view1.title.text = "Hành trình của bạn"
        uitilities.view1.subTitle.text = "Theo dõi lịch sử chặng bay đã hoàn thành"
        uitilities.view1.icon.image = UIImage(named: "group17832")
        uitilities.view1.tapView.tag = 3
        uitilities.view1.tapView.addTarget(self, action: #selector(selectView), for: .touchUpInside)
        
        uitilities.view2.title.text = "Phương thức thanh toán"
        uitilities.view2.subTitle.text = "Quản lý phương thức thanh toán"
        uitilities.view2.icon.image = UIImage(named: "group17833")
        uitilities.view2.tapView.tag = 4
        uitilities.view2.tapView.addTarget(self, action: #selector(selectView), for: .touchUpInside)
    }
    
    @objc func selectView(button: UIButton) {
        
        switch button.tag {
        case 1:
            print("\(person.view1.title.text!)")
            
            let sb = UIStoryboard(name: "AccountInformation", bundle: Bundle.main)
            let vc = sb.instantiateViewController(withIdentifier: "AccountInformation") as! AccountInformationViewController
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
        case 2:
            print("\(person.view2.title.text!)")
            break
        case 3:
            print("\(uitilities.view1.title.text!)")
            break
        case 4:
            print("\(uitilities.view2.title.text!)")
            break
        default:
            print("Default")
            break
        }
        
    }
    
    func setupNaviBar() {
        naviBar.logoutBtn.isHidden = false
        naviBar.naviTitle.text = "My Profile"
        naviBar.backBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        naviBar.logoutBtn.addTarget(self, action: #selector(buttonLoguotAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func buttonLoguotAction(){
        
        if let destinationViewController = navigationController?.viewControllers
                                                                .filter(
                                              {$0 is MyProfileViewController})
                                                                .first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        }

    }
 


}
