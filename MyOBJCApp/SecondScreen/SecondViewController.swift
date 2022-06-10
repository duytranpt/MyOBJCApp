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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "API"
        readAPI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "Cell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }
    @IBAction func backToMain(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func deleteAll(_ sender: Any) {
        items.removeAll()
        tableView.reloadData()
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

        
        let point = button.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else { return }
     
        items.remove(at: indexpath.section)
        tableView.beginUpdates()
        tableView.deleteSections([indexpath.section], with: .left)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
}
