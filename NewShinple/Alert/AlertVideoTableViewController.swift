//
//  AlertVideoTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class AlertVideoTableViewController: UITableViewController {
    
    var flag = [Bool](repeating: false, count: 4)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertVideoTableViewCell") as! AlertVideoTableViewCell

        if row == 0 {
            cell.lblTitle.text = "댓글알림"
//            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다."

            cell.lblDate.text = "19.09.09"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
            }
            
        } else if row == 1 {
            cell.lblTitle.text = "공지알림"
            cell.lblContent.text = "새로운 공지가 등록되었습니다."
            cell.lblDate.text = "19.09.08"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
            }
            
        } else {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.07"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
            }
        }
        
        return cell
    }
    
    //table cell 클릭시 이동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        
        let segueIdentifier = "goToAlertVideoDetail"

        // 눌렀을 때는 이미지가 회색으로
        if(!flag[indexPath.row]) {
            flag[indexPath.row] = true
        }
        tableView.reloadData()
        
        // 이동
        self.performSegue(withIdentifier: segueIdentifier, sender: self)

    }
}

extension AlertVideoTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 공지사항")
    }
}
