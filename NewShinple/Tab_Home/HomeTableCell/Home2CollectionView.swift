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
    
    // for 메인 페이지
    var titles:[String] = []
    var imgurls:[URL] = []
    var videoRates:CGFloat = 0
    
    // for 더보기 페이지
    var contents:[String] = []
    var videoTimes:[Int] = []
    var favorites:[Bool] = []
    
    var recent = [Any]()
    
    func dbGetRecentLectures(e_num: NSNumber) {
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.filterExpression = "E_num = :E_num"
        scanExpression.projectionExpression = "My_num, C_status, Duty, E_date, E_num, J_status, L_length, L_link_img, L_link_video, L_name, S_cate_num, U_length, Lecture_num, L_content"
        scanExpression.expressionAttributeValues = [":E_num":Int(truncating: e_num)]
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDbObjectMapper.scan(My_Lec_List.self, expression: scanExpression).continueWith(block: { (task:AWSTask!) -> AnyObject? in
            if task.result != nil {
                let paginatedOutput = task.result! as AWSDynamoDBPaginatedOutput
                var indexAry = [Double]()
                let formatter = DateFormatter()
                var lectureMy = [My_Lec_List]()
                formatter.dateFormat = "yyyy-MM-dd"
                let today = Date()
                for item in paginatedOutput.items as! [My_Lec_List] {
                    if item._U_length == 0 {
                        continue
                    }
                    let upload = formatter.date(from: item._W_date!)
                    let interval = upload?.timeIntervalSince(today) as! Double
                    var inserted = false
                    var index = 0
                    for indexItem in indexAry {
                        if interval >= indexItem {
                            lectureMy.insert(item, at: index)
                            indexAry.insert(interval, at: index)
                            inserted = true
                            break
                        }
                        index += 1
                    }
                    if !inserted {
                        lectureMy.append(item)
                        indexAry.append(interval)
                    }
                    print("hash")
                }
                print(lectureMy)
            }
            if ((task.error) != nil) {
                print("Error: \(String(describing: task.error))")
            }
            return nil
        })
    }
    
    
    func dbGetMyLecturesFromMainLectures(e_num:NSNumber, fromLectures:[String:[Any]]) {
        var toLectures = [String:[Any]]()
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.filterExpression = "E_num = :E_num"
        scanExpression.projectionExpression = "My_num, C_status, Duty, E_date, E_num, J_status, L_length, L_link_img, L_link_video, L_name, Lecture_num, S_cate_num, U_length, W_date"
        scanExpression.expressionAttributeValues = [":E_num":Int(truncating: e_num)]
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDbObjectMapper.scan(My_Lec_List.self, expression: scanExpression).continueWith(block: { (task:AWSTask!) -> AnyObject? in
            if task.result != nil {
                let paginatedOutput = task.result! as AWSDynamoDBPaginatedOutput
                for item in paginatedOutput.items as! [My_Lec_List] {
                    for key in fromLectures.keys {
                        if fromLectures[key] == nil {
                            toLectures[key] = fromLectures[key]
                            continue
                        }
                        var temp = [Any]()
                        for data in fromLectures[key]! {
                            if (data as AnyObject)._Lecture_num == item._Lecture_num {
                                temp.append(item)
                            } else {
                                temp.append(data)
                            }
                        }
                        toLectures[key] = temp
                    }
                }
                print("resolved item....", toLectures)
                
                //toLectures["new"]
                
                self.recent = toLectures["new"]!
                
                DispatchQueue.main.async(execute: {
                    self.reloadData()
                    print(self.recent, "kisung helel")
                })
                
                
                
            }
            if ((task.error) != nil) {
                print("Error: \(String(describing: task.error))")
            }
            return nil
        })
    }
    
    func dbGetMainLectures(e_num:NSNumber) {
        func parseListData(beforeParsed:NSArray) -> [String] {
            var parsed: [String] = []
            for item in beforeParsed {
                parsed.append(item as! String)
            }
            return parsed
        }
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.filterExpression = "Lecture_num > :Lecture_num"
        scanExpression.projectionExpression = "Lecture_num, E_date, L_cate, Duty, L_content, L_length, L_link_img, L_link_video, L_name, L_rate, L_teacher, S_cate, S_cate_num, U_date, L_count"
        scanExpression.expressionAttributeValues = [":Lecture_num":0]
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        print("debug0_kisung")
        dynamoDbObjectMapper.scan(LECTURE.self, expression: scanExpression).continueWith(block: { (task:AWSTask!) -> AnyObject? in
            if task.result != nil {
                var lectureResult = [String:[Any]]()
                print("debug1_kisung")
                let paginatedOutput = task.result! as AWSDynamoDBPaginatedOutput
                var lectureFamous = [Any]()
                var lectureNew = [Any]()
                var lectureDuty = [Any]()
                var lectureCare = [Any]()
                var lectureDevelop = [Any]()
                var lectureCulture = [Any]()
                var lectureEnglish = [Any]()
                var lectureCerticate = [Any]()
                var lectureFinance = [Any]()
                
                var indexAry = [Double]()
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let today = Date()
                for item in paginatedOutput.items as! [LECTURE] {
                    let upload = formatter.date(from: item._U_date!)
                    let interval = upload?.timeIntervalSince(today) as! Double
                    var inserted = false
                    var index = 0
                    for indexItem in indexAry {
                        if interval >= indexItem {
                            lectureNew.insert(item, at: index)
                            indexAry.insert(interval, at: index)
                            inserted = true
                            break
                        }
                        index += 1
                    }
                    if !inserted {
                        lectureNew.append(item)
                        indexAry.append(interval)
                    }
                    
                    index = 0
                    inserted = false
                    for famous in lectureFamous {
                        if item._L_count?.intValue ?? 0 >= (famous as AnyObject)._L_count?.intValue ?? 0 {
                            lectureFamous.insert(item, at:index)
                            inserted = true
                            break
                        }
                        index += 1
                    }
                    if !inserted {
                        lectureFamous.append(item)
                    }
                }
                
                for item in lectureNew as! [LECTURE] {
                    if item._Duty == 1 {
                        lectureDuty.append(item)
                    }
                    switch(item._L_cate) {
                    case "Care":
                        lectureCare.append(item)
                        break
                    case "develop":
                        lectureDevelop.append(item)
                        break
                    case "Finanace":
                        lectureFinance.append(item)
                        break
                    case "Culture":
                        lectureCulture.append(item)
                        break
                    case "English":
                        lectureEnglish.append(item)
                        break
                    case "Certicate":
                        lectureCerticate.append(item)
                        break
                    default:
                        break
                    }
                }
                lectureResult["duty"] = lectureDuty
                lectureResult["new"] = lectureNew
                lectureResult["famous"] = lectureFamous
                lectureResult["care"] = lectureCare
                lectureResult["develop"] = lectureDevelop
                lectureResult["finance"] = lectureFinance
                lectureResult["culture"] = lectureCulture
                lectureResult["english"] = lectureEnglish
                lectureResult["certicate"] = lectureCerticate
                
                print("function started")
                self.dbGetMyLecturesFromMainLectures(e_num: e_num, fromLectures: lectureResult)
                if ((task.error) != nil) {
                    print("Error: \(String(describing: task.error))")
                }
                
            }
            
            return nil
        })
    }
    
    
    
    
    
    
    //---------- Cell 셋팅 ----------//
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        dbGetMainLectures(e_num: 1100012)
        print("collectionView")
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if recent.count == 0 {
            return 0
        }
        return 10
    }

    
//    override func reloadData() {
//        self.reloadData()
//    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("start cellForItemAt")
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2CollectionViewCell", for: indexPath) as! Home2CollectionViewCell
        
        //Title
        
        
//        cell.lblTitle.text = titles[indexPath.row]
        var item = recent[indexPath.row]
        if type(of: item) == My_Lec_List.self {
            let data = item as! My_Lec_List
            cell.lblTitle.text = data._L_name
            cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
            videoRates = CGFloat(data._U_length!)
//            cell.imgVideo.downloadImage(from: imgurls[indexPath.row])

        } else {
            let data = item as! LECTURE
            cell.lblTitle.text = data._L_name
            cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
            videoRates = CGFloat(0)
        }
        
        let shapeLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 85/2, y: 85/2), radius: 85/2, startAngle: -CGFloat.pi/2, endAngle: videoRates, clockwise: true)
        
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


