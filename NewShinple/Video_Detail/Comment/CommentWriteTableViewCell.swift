//
//  CommentWriteTableViewCell.swift
//  NewShinple
//
//  Created by user on 01/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class CommentWriteTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewComment: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textViewComment.layer.borderWidth = 0
        textViewComment.layer.cornerRadius = 4

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
