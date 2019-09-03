//
//  CommentWriteTableViewCell.swift
//  NewShinple
//
//  Created by user on 01/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class CommentWriteTableViewCell: UITableViewCell {

    // user 정보
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblToday: UILabel!
    @IBOutlet weak var textViewComment: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textViewComment.layer.borderWidth = 0
        textViewComment.layer.cornerRadius = 4

        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy.MM.dd"
        let formattedDate = format.string(from: date)
        lblToday.text = formattedDate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
