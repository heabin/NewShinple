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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

