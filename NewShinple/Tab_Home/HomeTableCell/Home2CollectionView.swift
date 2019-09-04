//
//  Home2CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class Home2CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    
    
    
    //---------- Data 셋팅 ----------//
    
    // for 메인 페이지
    var titles:[String] = []
    var imgurls:[URL] = []
    var videoRates:[CGFloat] = []
    
    // for 더보기 페이지
    var contents:[String] = []
    var videoTimes:[Int] = []
    var favorites:[Bool] = []
    
    
    
    //---------- Cell 셋팅 ----------//
    override func awakeFromNib() {
        
        self.delegate = self
        self.dataSource = self
        
        let getDataFromHome = HomeTableViewController()
        let recent = getDataFromHome.setSampleRecentData()

        print(recent)

        for i in 0..<10 {
            titles.append(recent[i]._L_name!)
            imgurls.append(URL(string: recent[i]._L_link_img!)!)
            videoRates.append(CGFloat(Int(recent[i]._U_length!) / Int(recent[i]._L_length!)))
            
            contents.append("Today let's talk about salaries and how much money you can make as an iOS / Android Engineer out in the Bay Area / Silicon Valley.")
            videoTimes.append(Int(recent[i]._L_length!))
            favorites.append(recent[i]._J_status! as! Bool)
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
        
        //Title
        cell.lblTitle.text = titles[indexPath.row]
        
        
        //Image
        
        cell.imgVideo.layer.cornerRadius = 65/2
        
        cell.imgVideo.downloadImage(from: imgurls[indexPath.row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        
        let shapeLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 85/2, y: 85/2), radius: 85/2, startAngle: -CGFloat.pi/2, endAngle: videoRates[indexPath.row], clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = .none
        
        cell.imgVideo.layer.masksToBounds = true
        cell.imgVideo.layer.cornerRadius = 85/2
        
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


