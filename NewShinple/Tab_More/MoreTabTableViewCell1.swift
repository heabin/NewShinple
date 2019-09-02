//
//  MoreTabTableViewCell.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

/*
 
 더보기 탭에서 이미지, 이름, 사번, 직책등 정보를 입력하는 셀 입니다.
 
 */
import UIKit



class MoreTabTableViewCell1: UITableViewCell {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var deptAndPosition: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var stackViewInfo: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
