//
//  VideoInfoViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class VideoInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell

            return cell
        }else if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewScoreTableViewCell") as! ReviewScoreTableViewCell


            return cell
        }else if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewWriteTableViewCell") as! ReviewWriteTableViewCell
            
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell


            return cell
        }
    }
    

    @IBOutlet weak var lblVideoTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SSssss")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {
            return 100
        }else if row == 1 {
            return 150
        } else if row == 2 {
            return 130
        } else {
            return 130
        }
    }
    

}

extension VideoInfoViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 정보")
    }
}
