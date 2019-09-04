//
//  Home3CollectionViewCell.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class Home3CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblVideoTime: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
    
    override func awakeFromNib() {
        imgCheck.isHidden = true
        
        lblVideoTime.font = UIFont.boldSystemFont(ofSize: 12)
        lblVideoTime.backgroundColor = .black
        lblVideoTime.textColor = .white
    }
    
}
