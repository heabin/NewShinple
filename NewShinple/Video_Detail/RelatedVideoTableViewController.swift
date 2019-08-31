//
//  RelatedVideoTableViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class RelatedVideoTableViewController: UITableViewController {

    var weather:[String] = ["cloud", "snowflake", "sun", "umbrella", "wind"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
      
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = weather[indexPath.row]
        // Configure the cell...

        return cell
    }
    

 
}

extension RelatedVideoTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "연관 강의")
    }
}
