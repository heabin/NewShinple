//
//  AlertTwoViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//


import UIKit
import XLPagerTabStrip

class AlertTwoViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertVideoSID")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertAllSID")
  
        
        return [child_1 ,child_2 ]
    }
    
    func loadDesign() {
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarBackgroundColor = UIColor(red: 222/255, green: 65/255, blue: 27/255, alpha: 1.0)
        self.settings.style.buttonBarItemBackgroundColor = UIColor(red: 222/255, green: 65/255, blue: 27/255, alpha: 1.0)
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

