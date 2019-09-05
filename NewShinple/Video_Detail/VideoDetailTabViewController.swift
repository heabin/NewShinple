//
//  VideoDetailTabViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class VideoDetailTabViewController: ButtonBarPagerTabStripViewController{
    
    var lecture:LECTURE = LECTURE()
    
    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()
        print("VideoDetailTabViewController \(lecture)")
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID") as! VideoDetailViewController
        
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewVideoInfoSID")  as! NewVideoInfoViewController
        child_1.lecture = self.lecture
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RelatedVideoSID")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoCommentSID")
        
        return [child_1 ,child_2 ,child_3]
    }
    
    
    func loadDesign() {
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarBackgroundColor = .black
        
        //탭바 선택시 바 컬러 조정값
        self.settings.style.buttonBarItemBackgroundColor = .black
        
        //탭바 선택시 언더바 컬러 조정값
        self.settings.style.selectedBarBackgroundColor = .white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 4.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10
        self.settings.style.buttonBarRightContentInset = 10
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in guard changeCurrentIndex == true else {return}
            oldCell?.label.textColor = UIColor.white
            newCell?.label.textColor = UIColor.white
        }
        
        
        
    }
    
    
    



}
