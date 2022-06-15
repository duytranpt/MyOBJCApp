//
//  ThirdViewController.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 13/06/2022.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "Cell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        
        tableView.register(UINib(nibName: "CellForMP", bundle: Bundle.main), forCellReuseIdentifier: "CellForMP")
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ThirdViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
            break
        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForMP", for: indexPath)
//            return cell
            break
        default:
            print("Xin chào")
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForMP", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        headerView.backgroundColor = .cyan
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
    }
}
