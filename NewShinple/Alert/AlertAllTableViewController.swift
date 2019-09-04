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
    
    var flag = [Bool](repeating: false, count: 4)
    let colorLightGray = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    
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
        
        
        if row == 0 {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.09"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
            
        } else if row == 1 {
            cell.lblTitle.text = "공지알림"
            cell.lblContent.text = "새로운 공지가 등록되었습니다."
            cell.lblDate.text = "19.09.08"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
            
        } else {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.07"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
        }
        
        return cell
    }
    
    //table cell 클릭시 이동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let segueIdentifier = "goToAlertAllDetail"
        
        // 눌렀을 때는 이미지가 회색으로
        if(!flag[indexPath.row]) {
            flag[indexPath.row] = true
        }
        tableView.reloadData()
        
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
    }

}


extension AlertAllTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "전체 공지사항")
    }
}
