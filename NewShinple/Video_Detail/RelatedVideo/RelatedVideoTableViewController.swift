//
//  RelatedVideoTableViewController.swift
//  NewShinple
//
//  Created by 혜빈 on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class RelatedVideoTableViewController: UITableViewController, UISearchBarDelegate, UITextViewDelegate {
    
    
    let colorLightGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    
    let colorStartBlue = UIColor(red: 37/255, green: 97/255, blue: 166/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 45/255, green: 132/255, blue: 194/255, alpha: 1)
    let colorEndBlue = UIColor(red: 53/255, green: 169/255, blue: 223/255, alpha: 1)
    
    var isSearchBarFocused = false
    var lectureArray = [String]()
    var currentLectureArray = [String]()
    var searchedBefore = [String?]()
    struct cgFloatInt {
        var width: Int
        var height: Int
        var widthSpacing: Int
        var heightSpacing: Int
        var buttonSizing: Int
        init(w: Int, h:Int, ws:Int, hs:Int, bs:Int) {
            width = w
            height = h
            widthSpacing = ws
            heightSpacing = hs
            buttonSizing = bs
        }
    }
    var custom: cgFloatInt = cgFloatInt(w: 25, h: 30, ws: 200, hs:35, bs:100)
    
    

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
        return IndicatorInfo(title: "강의 목록")
    }
}
