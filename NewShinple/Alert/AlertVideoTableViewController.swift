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
    let colorLightGray = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    
    var alertkey:[Int] = []
    var titles:[String] = []
    var contents:[String] = []
    var dates:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<5 {
            
        }
        
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
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다.동영상 댓글에 답글이 달렸습니다."

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
        let gotovideodetail: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID")

        
        if(!flag[indexPath.row]) {
            flag[indexPath.row] = true
        }
        tableView.reloadData()
        
        self.present(gotovideodetail, animated: true, completion: nil)
        
    }
}

extension AlertVideoTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 공지사항")
    }
}
