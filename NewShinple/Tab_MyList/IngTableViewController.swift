//
//  IngTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//


import UIKit
import XLPagerTabStrip

class IngTableViewController: UITableViewController {
    
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video6.png"]
    var videoRate:[Float] = [0.3, 0.2, 0.5, 0.4, 0.1, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngCellIdentifier", for: indexPath) as! IngTableViewCell
        
        cell.lblTitle.text = titles
        cell.lblContent.text = contents
        
        
        cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
//        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        
        cell.btnFavorite.setImage(heartFill, for: .normal)
        cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
        
        cell.sliderTime.setValue(videoRate[row], animated: false)
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailPage()
    }
    
    
    
    //---------- SID를 통한 Video 상세페이지 이동 ----------//
    func goToDetailPage() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID")
        self.present(viewController, animated: true, completion: nil)
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


extension IngTableViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripViewController: PagerTabStripViewController)->IndicatorInfo {
        return IndicatorInfo(title: "수강중")
    }
}
