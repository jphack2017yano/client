//
//  CustomTableViewCell.swift
//  Client
//
//  Created by 会津慎弥 on 2017/10/22.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var cardImageButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
