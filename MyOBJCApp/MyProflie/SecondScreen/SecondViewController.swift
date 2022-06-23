//
//  SecondViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 09/06/2022.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
   
    var items: [Display] = []
    var models: [Person] = []

//    @IBOutlet weak var profileView: Profile!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "API"
        readAPI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "Cell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        tableView.sectionFooterHeight = 16
        tableView.sectionHeaderTopPadding = 0
        add.layer.cornerRadius = add.frame.height/2

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }
    @IBAction func backToMain(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func deleteAll(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Xoá danh bạ hành khách", message: "Bạn có chắc chắn muốn danh bạ này không. Danh bạ bị xoá sẽ không thể khôi phục được", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Xác nhận", style: .destructive, handler: { [self] (alertAction) in
            self.items.removeAll()
            tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: { (alertAction)  in
        }))
        
        self.present(alert, animated: true)
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Third", bundle: Bundle.main)
        let ThirdVC = storyBoard.instantiateViewController(withIdentifier: "Third") as! ThirdViewController
    
        navigationController?.pushViewController(ThirdVC, animated: true)
    }
}

extension SecondViewController {
    
    func readAPI() {
        let request = AF.request("https://testapi.io/api/duytran/test")
    
        request.responseDecodable(of: People.self) { (response) in
            guard let person = response.value else { return }
            print(person.root[0].fullName)
            self.items = person.root
            self.tableView.reloadData()
            self.models = person.root
            
        }

    }
}

extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let callCell = cell.customCell
        
        callCell?.phoneNumberLabel.text = items[indexPath.section].sdt
        callCell?.dateOfBirthLabel.text = items[indexPath.section].ngaySinh
        if items[indexPath.section].gioiTinh == true {
            callCell?.sexLabel.text = "Nam"
        } else {
            callCell?.sexLabel.text = "Nữ"
        }
        callCell?.fullNameLabel.text = items[indexPath.section].hoTen
        callCell?.noperson.text = "Hành khách \(indexPath.section + 1)"
        callCell?.deleteBtn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        callCell?.deleteBtn.tag = indexPath.section
        return cell
    }
    
    @objc func tapped(button: UIButton) {

        print("Xem chi tiết")
//        let point = button.convert(CGPoint.zero, to: tableView)
//        guard let indexpath = tableView.indexPathForRow(at: point) else { return }
//
//        items.remove(at: indexpath.section)
//        tableView.beginUpdates()
//        tableView.deleteSections([indexpath.section], with: .left)
//        tableView.endUpdates()
        
      

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "") { [self] (contextual, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Xoá danh bạ hành khách", message: "Bạn có chắc chắn muốn danh bạ này không. Danh bạ bị xoá sẽ không thể khôi phục được", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Xác nhận", style: .destructive, handler: { (alertAction) in
                self.items.remove(at: indexPath.section)
                tableView.beginUpdates()
                tableView.deleteSections([indexPath.section], with: .left)
                tableView.reloadData()
                tableView.endUpdates()
                actionPerformed(true)

            }))

            alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: { (alertAction)  in
                actionPerformed(false)
            }))

            self.present(alert, animated: true)
            
                        

        }
        
        delete.backgroundColor = UIColor(named: "main")
        delete.image = UIImage(named: "delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil

    }
}
