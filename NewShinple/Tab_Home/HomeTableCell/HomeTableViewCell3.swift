//
//  HomeTableViewCell3.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewCell3: UITableViewCell {
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var collectionView: Home3CollectionView!
    
    //var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        print("HomeTableVIewCell3_prepareForReuse----------")
    //    disposeBag = DisposeBag()
    }
    
    
    

}
