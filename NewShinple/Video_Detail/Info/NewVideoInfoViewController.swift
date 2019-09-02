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
    @IBOutlet weak var lblVideoInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblVideoInfo.translatesAutoresizingMaskIntoConstraints = false
        let fixedWidth = lblVideoInfo.frame.size.width
        let newSize = lblVideoInfo.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        lblVideoInfo.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewVideoInfoViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 정보")
    }
}

