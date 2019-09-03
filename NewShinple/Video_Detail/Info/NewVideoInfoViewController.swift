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
    
    var test: String = ""
    
    @IBOutlet weak var lblVideoTitle: UILabel!
    @IBOutlet weak var tvVideoInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvVideoInfo.isScrollEnabled = true
        resize(textView: tvVideoInfo)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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

