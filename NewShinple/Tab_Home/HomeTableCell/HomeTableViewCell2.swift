//
//  HomeTableViewCell2.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewCell2: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        print("HomeTableViewCell2_prepareForeReuse----------")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
