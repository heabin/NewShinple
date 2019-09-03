//
//  HomeMoreTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeMoreTableViewController: UITableViewController {
    
    
    //---------- 공통 Color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    
    
    
    //---------- 샘플 Data ----------//
    //*----------------------------------------------------*//
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var imagieFiles = ["video10.png", "video9.png", "video8.png", "video7.png", "video6.png","video5.png", "video4.png", "video3.png", "video2.png", "video.png"]
    let url = URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Disabled/image/Chap1.png")
    var videoTime:[Int] = [15000,4000,3000,2000,1000,6000,7000,8000,9000,10000]
    var videoRate:[Float] = [0,0.3,0.7,0,0.1,0,0,0.3,0,0]
    
    
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    
    
    //---------- Important Variable ----------//
    
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
        //*----------------------------------------------------*//
        return 10
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
            cell.lblContent.text = contents
            
            //*----------------------------------------------------*//
            cell.imgVideo.downloadImage(from: url!)
            cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
            
            cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
            cell.sliderTime.setValue(videoRate[row], animated: false)
            
            cell.lblVideoTime.text = timeIntToString(from: videoTime[row])
        
        return cell
        }
    }
    
    
    //---------- 좋아요 선택/해제 ----------//
    
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }
    
    
    
    //---------- 동영상 총 시간 ----------//

    func timeIntToString(from time: Int) -> String {
        
        let totalSeconds = time
        let hours = Int(totalSeconds / 3600 )
        let minutes = Int(totalSeconds % 3600) / 60
        let seconds = Int(totalSeconds % 3600) % 60
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }

}


//*----------------------------------------------------*//
extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}
