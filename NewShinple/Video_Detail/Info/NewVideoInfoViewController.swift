//
//  NewVideoInfoViewController.swift
//  NewShinple
//
//  Created by user on 02/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class NewVideoInfoViewController: UIViewController {
    
    @IBOutlet weak var lblVideoTitle: UILabel!
    @IBOutlet weak var tvVideoInfo: UITextView!
    @IBOutlet weak var lblUploadDate: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    
    var lecture:LECTURE = LECTURE()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblVideoTitle.text = lecture._L_name
        lblUploadDate.text = lecture._U_date
        lblDueDate.text = lecture._E_date
        tvVideoInfo.text = lecture._L_content
        
        tvVideoInfo.isEditable = false
        tvVideoInfo.isScrollEnabled = true
        resize(textView: tvVideoInfo)
        
    }
    
    fileprivate func resize(textView: UITextView) {
        var newFrame = textView.frame
        let width = newFrame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        newFrame.size = CGSize(width: width, height: newSize.height)
        textView.frame = newFrame
    }
}

extension NewVideoInfoViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 정보")
    }
}

