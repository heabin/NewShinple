//
//  HomeMoreTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

protocol selectMoreCategoryDelegate {
    func selectedCategoryName(_ controller: HomeMoreTableViewController, message: String)
}

class HomeMoreTableViewController: UITableViewController {
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var date: String = "19.09.09"
    var number: Int = 80
    
    var imagieFiles = ["video10.png", "video9.png", "video8.png", "video7.png", "video6.png","video5.png", "video4.png", "video3.png", "video2.png", "video.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    var delegate : selectMoreCategoryDelegate?
    
    
    var mainTitleName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return 120
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagieFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoreTableViewCell1") as! HomeMoreTableViewCell1
            
            cell.lblCategory.text = mainTitleName
            
            return cell
            
        } else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoreTableViewCell2") as! HomeMoreTableViewCell2
            
            
            cell.lblTitle.text = titles
            cell.lblWatchingTime.text = "진행률: " + String(number) + " %"
            cell.lblContent.text = contents
            
            
            cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
            cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
            
            if indexPath.row % 2 == 0 {
                cell.btnFavorite.setImage(heartFill, for: .normal)
            }else {
                cell.btnFavorite.setImage(heartEmpty, for: .normal)
            }
            
            cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
        
        return cell
        }
    }
    
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }

}
