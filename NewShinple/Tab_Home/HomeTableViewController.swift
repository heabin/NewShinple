//
//  HomeTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    var userName = "권민재"
    var categories = ["마이페이지", "최근시청강의", "필수 강의", "인기 강의", "신규 강의" ,"[대분류1] ICT개발", "[대분류2] 인프라", "[대분류3] 정보보안"]
    
    //TableView cell
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if row == 0 {
            return 40
        } else if row == 1 {
            return 190
        }else {
            return 160
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
            
            return cell
        }else if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell2") as! HomeTableViewCell2
            
            cell.lblName.text = userName
            cell.lblCategory.text = "님의 최근시청 강의입니다."
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell3") as! HomeTableViewCell3
            
            cell.lblCategory.text = categories[indexPath.row]
            cell.collectionView.tag = indexPath.row
            
            return cell
        }
    }
}
