//
//  EndTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class EndTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EndCellIdentifier", for: indexPath) as! EndTableViewCell
        
        
        
        
        return cell
    }
}

extension EndTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "수강 완료")
    }
}
