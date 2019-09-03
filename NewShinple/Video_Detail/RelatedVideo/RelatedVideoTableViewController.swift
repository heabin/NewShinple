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
    
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var number: Int = 80
    
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video6.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
      
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagieFiles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! RelatedVideoTableViewCell
        
        cell.lblTitle.text = titles
        cell.lblContent.text = contents
        
        
        cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        
        
        cell.btnFavorite.setImage(heartFill, for: .normal)
        
        cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
        
        
        
        return cell
    }
    
    
    //---------- 좋아요 클릭/해제 ----------//
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }
 
}

extension RelatedVideoTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "강의 목록")
    }
}
