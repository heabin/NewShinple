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
    
    var titles = ["세상에 나쁜개는 없다","캠핑 클럽","놀라운 토요일","삼시세끼", "나 혼자 산다"]
    
    var imagieFiles = ["video.png", "video2.png", "video3.png","video4.png","video5.png"]
    
    var videoRate:[CGFloat] = [2.3, 0.5, 3.7, 2.0, 1.0]
    
    var testurl = URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Poutine.png")
    
    
    
    //---------- Cell 셋팅 ----------//
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
        
        //Title
        cell.lblTitle.text = titles[indexPath.row]
        
        
        
        //Image
        
        cell.imgVideo.layer.cornerRadius = 65/2
        
        cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
        
        
        //image url 사용
        //let testdata = try! Data(contentsOf: testurl!)
        //cell.imgVideo.image = UIImage(data: testdata)
        // video 재생 정도 표시
        
        let shapeLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 85/2, y: 85/2), radius: 85/2, startAngle: -CGFloat.pi/2, endAngle: videoRate[indexPath.row], clockwise: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        HomeTableViewController().goToDetailPage()
    }
    
    
    

}
