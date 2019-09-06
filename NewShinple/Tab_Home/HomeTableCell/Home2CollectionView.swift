//
//  Home2CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AWSDynamoDB

class Home2CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    
    
    
    //---------- Data 셋팅 ----------//
    

    
    // for 더보기 페이지
    var titles:[String] = ["제2강. 당신이 지금 알아야 할 AWS",
                           "제2강. The 친절한 Swift 프로그래밍",
                           "제1강. 당신이 지금 알아야 할 AWS",
                           "제3강. Python과 Pygame으로 게임 만들기",
                           "제2강. Python과 Pygame으로 게임 만들기",
                           "제1강. Python과 Pygame으로 게임 만들기",
                           "제1강. 10대와 통하는 스포츠 이야기",
                           "제1강. 토익의 입문"]
    var imgurls:[URL] = [URL(string: "https://i.ytimg.com/vi/IT1X42D1KeA/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB3CWoxZXCTioGUkjTzcd9buox2CA.png")!,
                         URL(string: "https://i.ytimg.com/vi/uvTLGIJaRGk/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLAI-aqk24mLHLy321TLMpefk2OX9Q.png")!,
                         URL(string: "https://i.ytimg.com/vi/5tVMLbnNULc/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLAXyYyLiLy1Eas8Boqmb4NSjrcGbQ.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp3.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Sport/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/TOEIC/image/Chap3.png")!]
    
    var videoRates:[Float] = [0.5, 2.7, 0.9, 0.2, 0.1, 0.2, 0]
    var contents:[String] = ["가장 강력한 클라우드 서비스를 경험하기 위한 최고의 AWS 가이드클라우드",
                             "스위프트 4에 맞춰 개정한 스위프트의 A TO Z!스위프트 4의 핵심",
                             "STRING 관련 편의성 증가, 여러 줄 리터럴 문법, 서브스크립트 문법 강화",
                             "Pygame 라이브러리에 대한 소개와 함께 2D 그래픽 게임",
                             "기본적인 머신 러닝 알고리즘(선형회귀, KNN, K-MEANS)",
                             "한국데이터베이스진흥원에서 실시하고 있는 데이터 분석 전문가 자격증",
                             "‘스포츠의 주인’이 되기 위해 꼭 알아야 할 스포츠 이야기 올림픽",
                             "토익 실전을 완벽 대비하고 단기에 고득점"]
    var videoTimes:[Int] = [3300, 2000, 5200, 2500, 6030, 6700, 5300]
    var favorites:[Bool] = [false, true, true, true, true, false, false]
    
    
    
    
    //---------- Cell 셋팅 ----------//
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        //dbGetMainLectures(e_num: 1100012)
        //dbGetRecentLectures(e_num: 1100012)
        print("collectionView")
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var row = indexPath.row
        
        print("start cellForItemAt")
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
        
        
        cell.lblTitle.text = titles[row]
        cell.imgVideo.downloadImage(from: imgurls[row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        let shapeLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 85/2, y: 85/2), radius: 85/2, startAngle: -CGFloat.pi/2, endAngle: CGFloat(videoRates[indexPath.row]), clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = .none
        
        cell.imgVideo.layer.cornerRadius = 65/2
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        cell.imgVideo.layer.masksToBounds = true
        cell.imgVideo.layer.cornerRadius = 85/2
        
        //Image

        
        cell.imgVideo.layer.addSublayer(shapeLayer)

        
        // 그라데이션 적용
        
        let gradient = CAGradientLayer()
        var bounds = cell.imgVideo.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = bounds
        gradient.colors = [colorEndBlue.cgColor, colorMiddleBlue.cgColor, colorStartBlue.cgColor]
        gradient.locations = [0.0,0.5,1.0]
        gradient.mask = shapeLayer
        
        cell.imgVideo.layer.addSublayer(gradient)

        
        return cell
    }
    

}


