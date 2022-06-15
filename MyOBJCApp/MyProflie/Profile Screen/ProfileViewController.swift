//
//  ProfileViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 10/06/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var data: [Section] = [
        Section(title: "Cá nhân",
                rows: [
                    row(mainTitle: "Thông tin tài khoản", image: UIImage(named: "1")!, subTitle: "Chỉnh sửa, cập nhật thông tin tài khoản My Profile"),
                    row(mainTitle: "Danh bạ hành khách bay", image: UIImage(named: "2")!, subTitle: "Quản lý thông tin của người thân hoạc bạn bè")
                ]),
        Section(title: "Tiện ích",
                rows: [
                    row(mainTitle: "Hành trình của bạn", image: UIImage(named: "3")!, subTitle: "Theo dõi lịch sử chặng bay đã hoàn thành"),
                    row(mainTitle: "Phương thức thanh toán", image: UIImage(named: "4")!, subTitle: "Quản lý phương thức than toán")
                ])
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancel: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CellForMP", bundle: Bundle.main), forCellReuseIdentifier: "CellForMP")
        
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderTopPadding = 16
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        setupButton()
    }
    
    func setupButton() {
        cancel.Title = "Xin chào"
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //        cancel.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    @IBAction func contact(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Alert", bundle: Bundle.main)
        let AlertVC = storyBoard.instantiateViewController(withIdentifier: "Alert") as! AlertViewController
        AlertVC.modalPresentationStyle = .formSheet
        
        self.present(AlertVC, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForMP", for: indexPath) as! CellForMP
        
        let callCell = cell.viewForMP
        let sort = data[indexPath.section].rows[indexPath.row]
        
        callCell?.mainTitle.text = sort.mainTitle
        callCell?.subTitle.text = sort.subTitle
        callCell?.icon.image = sort.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 1 {
            let storyBoard = UIStoryboard(name: "Second", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "Second") as! SecondViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            // delete the item here
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        
        
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = (data[section].title)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        vw.addSubview(label)
        label.leftAnchor.constraint(equalTo: vw.leftAnchor, constant: 16).isActive = true
        label.centerYAnchor.constraint(equalTo: vw.centerYAnchor).isActive = true
        return vw
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}

