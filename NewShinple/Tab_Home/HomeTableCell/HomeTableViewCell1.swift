//
//  HomeTableViewCell1.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewCell1: UITableViewCell, selectCategoryDelegate {
    
    
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var imgFirst: UIImageView!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var imgSecond: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        btnFirst.layer.zPosition = 1
        btnSecond.layer.zPosition = 1
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func selectFirstCategory(_ controller: CategoryTableViewController, message: String) {
        
        print("대분류 돌아옴")
        lblFirst.text = message
    }
    
    
    func selectSecondCatogory(_ controller: CategoryTableViewController, message: String) {
        print("소분류 돌아옴")
        lblSecond.text = message
    }


}
