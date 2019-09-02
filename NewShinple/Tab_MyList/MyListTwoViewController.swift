//
//  MyListTwoViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyListTwoViewController: ButtonBarPagerTabStripViewController {
    
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    
    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavoriteSID")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IngSID")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EndSID")
        
        return [child_1 ,child_2 ,child_3]
    }
    
    func loadDesign() {
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = colorStartBlue
        self.settings.style.buttonBarBackgroundColor = colorLightGray
        self.settings.style.buttonBarItemBackgroundColor = .clear
        self.settings.style.selectedBarBackgroundColor = UIColor.gray
        self.settings.style.buttonBarItemFont = .systemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 4.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = colorStartBlue
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10
        self.settings.style.buttonBarRightContentInset = 10
        
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in guard changeCurrentIndex == true else {return}
            oldCell?.label.textColor = UIColor.gray
            newCell?.label.textColor = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
        }
    }
    
    
}
