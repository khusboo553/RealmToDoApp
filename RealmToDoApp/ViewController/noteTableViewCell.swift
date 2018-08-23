//
//  noteTableViewCell.swift
//  RealmToDoApp
//
//  Created by GLB-311-PC on 22/08/18.
//  Copyright © 2018 Globussoft. All rights reserved.
//

import UIKit

class noteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteName: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
