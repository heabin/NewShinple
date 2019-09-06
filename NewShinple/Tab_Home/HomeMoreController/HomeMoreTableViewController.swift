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
    
    
    var titles:[String] = ["", "제2강. 당신이 지금 알아야 할 AWS",
                           "제2강. The 친절한 Swift 프로그래밍",
                           "제1강. 당신이 지금 알아야 할 AWS",
                           "제3강. Python과 Pygame으로 게임 만들기",
                            "제2강. Python과 Pygame으로 게임 만들기",
                            "제1강. Python과 Pygame으로 게임 만들기",
                            "제1강. 10대와 통하는 스포츠 이야기",
                            "제1강. 토익의 입문"]
    var imgurls:[URL] = [URL(string: "https://i.ytimg.com/an_webp/GNoZLjnwSP4/mqdefault_6s.webp?du=3000&sqp=CIq-xusF&rs=AOn4CLAodEMHWOWsjnoI9GNUlZZUGxt9Rg.png")!,
                         URL(string: "https://i.ytimg.com/vi/IT1X42D1KeA/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB3CWoxZXCTioGUkjTzcd9buox2CA.png")!,
                         URL(string: "https://i.ytimg.com/vi/uvTLGIJaRGk/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLAI-aqk24mLHLy321TLMpefk2OX9Q.png")!,
                         URL(string: "https://i.ytimg.com/vi/5tVMLbnNULc/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLAXyYyLiLy1Eas8Boqmb4NSjrcGbQ.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp3.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Sport/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/TOEIC/image/Chap3.png")!]
    
    var videoRates:[Float] = [0, 0.1, 0.5, 0.3, 0.2, 0.1, 0.2, 0]
    var contents:[String] = ["", "가장 강력한 클라우드 서비스를 경험하기 위한 최고의 AWS 가이드클라우드",
                             "스위프트 4에 맞춰 개정한 스위프트의 A TO Z!스위프트 4의 핵심",
                             "STRING 관련 편의성 증가, 여러 줄 리터럴 문법, 서브스크립트 문법 강화",
                             "Pygame 라이브러리에 대한 소개와 함께 2D 그래픽 게임",
                             "기본적인 머신 러닝 알고리즘(선형회귀, KNN, K-MEANS)",
                             "한국데이터베이스진흥원에서 실시하고 있는 데이터 분석 전문가 자격증",
                             "‘스포츠의 주인’이 되기 위해 꼭 알아야 할 스포츠 이야기 올림픽",
                             "토익 실전을 완벽 대비하고 단기에 고득점"]
    var videoTimes:[Int] = [0, 3300, 2000, 5200, 2500, 6030, 6700, 5300]
    var favorites:[Bool] = [false, false, true, false, false, true, false, false]
    
    
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    //---------- Important Variable ----------//
    
    var mainTitleName = ""
    
    var videoData = [Any]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getDataFromHome = HomeTableViewController()
        videoData = getDataFromHome.VideoData

        
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
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoreTableViewCell1") as! HomeMoreTableViewCell1
            
            cell.lblCategory.text = mainTitleName
            
            return cell
            
        } else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoreTableViewCell2") as! HomeMoreTableViewCell2
            
            cell.lblTitle.text = titles[row]
            cell.lblContent.text = contents[row]
            
            cell.imgVideo.downloadImage(from: imgurls[row])
            cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
            
            if favorites[row] == true {
                cell.btnFavorite.setImage(heartFill, for: .normal)
            }
            cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
            cell.sliderTime.setValue(videoRates[row], animated: false)
            
            cell.lblVideoTime.text = timeIntToString(from: videoTimes[row])
        
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



