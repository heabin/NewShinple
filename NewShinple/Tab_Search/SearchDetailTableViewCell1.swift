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
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var lblVideoTime: UILabel!
    @IBOutlet weak var sliderTime: UISlider!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgCheck.isHidden = true
        
        btnFavorite.imageView?.contentMode = .scaleAspectFit
        
        sliderTime.tintColor = .red
        sliderTime.setThumbImage(UIImage(), for: .normal)
        sliderTime.transform = CGAffineTransform(scaleX: 1, y: 3)
        sliderTime.setValue(0, animated: false)
        
        lblVideoTime.font = UIFont.boldSystemFont(ofSize: 12)
        lblVideoTime.backgroundColor = .black
        lblVideoTime.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
