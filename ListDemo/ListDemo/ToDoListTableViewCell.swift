//
//  ToDoListTableViewCell.swift
//  ListDemo
//
//  Created by Yejia Chen on 2/28/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoItemTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
