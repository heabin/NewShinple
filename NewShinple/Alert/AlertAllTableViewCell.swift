//
//  AlertAllTableViewCell.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class AlertAllTableViewCell: UITableViewCell {
    @IBOutlet weak var imgColor: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    func layout() {
        imgColor.layer.cornerRadius = imgColor.frame.width / 2
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
