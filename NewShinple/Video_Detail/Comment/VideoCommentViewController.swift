//
//  VideoReviewViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

var names = ["이신한", "이방훈", "박은채"]
var dates = ["2019.08.20", "2019.08.31", "2019.09.02"]
var comments = ["강의 영상 재미있게 잘 봤습니다!","어려운 내용을 쉽게 풀어주셨네요","if문과 switch문은 같다고 봐도 될까요?"]

class VideoCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var tableViewComments: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentWriteTableViewCell") as! CommentWriteTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
            cell.lblName?.text = names[(indexPath as NSIndexPath).row - 1]
            cell.lblDate?.text = dates[(indexPath as NSIndexPath).row - 1]
            cell.textViewComment.text = comments[(indexPath as NSIndexPath).row - 1]
            
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewComments.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewComments.reloadData()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("텍스트 변경중")
        
        
        let cell = tableViewComments.dequeueReusableCell(withIdentifier: "CommentWriteTableViewCell") as! CommentWriteTableViewCell
        
        print(NSMutableAttributedString(attributedString:  cell.textViewComment.attributedText))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {
            return 130
        } else {
            return 130
        }
    }
    
    @IBAction func AddComment(_ sender: UIButton) {
        print("댓글달기")
        let cell = tableViewComments.dequeueReusableCell(withIdentifier: "CommentWriteTableViewCell") as! CommentWriteTableViewCell
       
        names.append( cell.lblUser.text!)
        dates.append(cell.lblToday.text!)
        comments.append(cell.textViewComment.text)
        
        print(cell.textViewComment.text)
        print(cell.textViewComment.textStorage)
        print(cell.textViewComment.textContainer)
        
        
        print(comments)
        tableViewComments.reloadData()
    }
}

extension VideoCommentViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "댓글")
    }
}

