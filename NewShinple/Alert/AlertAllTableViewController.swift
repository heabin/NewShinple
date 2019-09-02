//
//  AlertAllTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AlertAllTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    //TableView cell
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertAllTableViewCell") as! AlertAllTableViewCell
        cell.imgColor.layer.cornerRadius = cell.imgColor.frame.width / 2
        //lblcolor.layer.cornerRadius = lblcolor.frame.width / 2
        
        if row == 0 {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.09"
            
        } else if row == 1 {
            cell.lblTitle.text = "공지알림"
            cell.lblContent.text = "새로운 공지가 등록되었습니다."
            cell.lblDate.text = "19.09.08"
            
        } else {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.07"
            cell.imgColor.backgroundColor = UIColor(red: 212/255, green: 202/255, blue: 212/255, alpha:1)
        }
        
        
        return cell
    }
}


extension AlertAllTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "전체 공지사항")
    }
}
