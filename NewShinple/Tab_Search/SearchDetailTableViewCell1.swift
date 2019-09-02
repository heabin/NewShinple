//
//  SearchDetailTableViewCell1.swift
//  NewShinple
//
//  Created by user on 01/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class SearchDetailTableViewCell1: UITableViewCell {

    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblWatchingTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFavorite.imageView?.contentMode = .scaleAspectFit
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
