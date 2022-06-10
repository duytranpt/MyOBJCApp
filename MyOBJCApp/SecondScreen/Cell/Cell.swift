//
//  Cell.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 09/06/2022.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var customCell: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
