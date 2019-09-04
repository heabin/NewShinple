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
var comments = ["강의 영상 재미있게 잘 봤습니다!강의 영상 재미있게 잘 봤습니다!강의 영상 재미있게 잘 봤습니다!강의 영상 재미있게 잘 봤습니다!강의 영상 재미있게 잘 봤습니다!강의 영상 재미있게 잘 봤습니다!","어려운 내용을 쉽게 풀어주셨네요어려운 내용을 쉽게 풀어주셨네요어려운 내용을 쉽게 풀어주셨네요어려운 내용을 쉽게 풀어주셨네요","if문과 switch문은 같다고 봐도 될까요?"]


class VideoCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    var settingHeight:CGFloat?  // 각 셀의 댓글 길이에 따른 동적 높이 생성
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        cell.lblName.text = names[(indexPath as NSIndexPath).row]
        cell.lblDate.text = dates[(indexPath as NSIndexPath).row]
        cell.textViewComment.text = comments[(indexPath as NSIndexPath).row]
        cell.textViewComment.isScrollEnabled = true

        let newFrame = cell.textViewComment.frame
        let width = newFrame.size.width
        let newSize =  cell.textViewComment.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        settingHeight = newSize.height
        
        return cell
    }
    
    
    // 각 셀의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        
        
        print(settingHeight)
        return 50 + settingHeight!
    }
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblToday: UILabel!
    @IBOutlet weak var tableViewComment: UITableView!
    @IBOutlet weak var textViewComment: UITextView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewComment.delegate = self
        
        textViewComment.layer.borderWidth = 0
        textViewComment.layer.cornerRadius = 4
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy.MM.dd"
        let formattedDate = format.string(from: date)
        lblToday.text = formattedDate
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewComment.reloadData()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("텍스트 변경중")
        
    }
    
    // DB 내보내기
    @IBAction func AddComment(_ sender: UIButton) {
        print("댓글달기")
        
        names.append(lblUserName.text!)
        dates.append(lblToday.text!)
        comments.append(textViewComment.text!)
        tableViewComment.reloadData()
        
        textViewComment.text = ""
        
        // DB 내보내기
//        lblUserName.text
        
    }
}

extension VideoCommentViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "댓글")
    }
}

