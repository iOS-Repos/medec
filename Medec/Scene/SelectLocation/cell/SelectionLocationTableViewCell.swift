//
//  SelectionLocationTableViewCell.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/10/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

class SelectionLocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationFlag: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
