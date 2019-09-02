//
//  ReviewScoreTableViewCell.swift
//  NewShinple
//
//  Created by user on 01/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class ReviewScoreTableViewCell: UITableViewCell {

    // Score View
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblCount: UILabel!

    @IBOutlet weak var btnStar1: UIButton!
    @IBOutlet weak var btnStar2: UIButton!
    @IBOutlet weak var btnStar3: UIButton!
    @IBOutlet weak var btnStar4: UIButton!
    @IBOutlet weak var btnStar5: UIButton!
    
    // Graph View
    @IBOutlet weak var slider5: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    
    let imgEmptyStar = UIImage(named: "star_empty")
    let imgFillStar = UIImage(named: "star_fill")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btnStar1.translatesAutoresizingMaskIntoConstraints = false
        btnStar1.setImage(imgFillStar, for: .normal)
        btnStar2.setImage(imgEmptyStar, for: .normal)
        
        btnStar1.imageView?.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
