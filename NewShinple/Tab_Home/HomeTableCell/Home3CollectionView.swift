//
//  Home3CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AWSDynamoDB

class Home3CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // for 메인 페이지
    var titles = [[String]]()
    var imgurls = [[URL]]()
    //var videoRates = [[CGFloat]]()
    var videoRates:CGFloat = 0
    var videoTimes = [[Int]]()
    
    // for 더보기 페이지
    var contents = [[String]]()
    var favorites = [[Bool]]()
    
    var duty = [Any]()
    var new = [Any]()
    var famous = [Any]()
    var care = [Any]()
    var develop = [Any]()
    var finance = [Any]()
    var culture = [Any]()
    var english = [Any]()
    var certicate = [Any]()
    
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
                print("resolved item2....", toLectures)
                
//                self.totalData[0] = toLectures["duty"]!
//                self.totalData[1] = toLectures["new"]!
//                self.totalData[2] = toLectures["famous"]!
//                self.totalData[3] = toLectures["care"]!
//                self.totalData[4] = toLectures["develop"]!
//                self.totalData[5] = toLectures["finance"]!
//                self.totalData[6] = toLectures["culture"]!
//                self.totalData[7] = toLectures["english"]!
//                self.totalData[8] = toLectures["certicate"]!
                
                self.duty = toLectures["duty"]!
                self.new = toLectures["new"]!
                self.famous = toLectures["famous"]!
                self.care = toLectures["care"]!
                self.develop = toLectures["develop"]!
                self.finance = toLectures["finance"]!
                self.culture = toLectures["culture"]!
                self.english = toLectures["english"]!
                self.certicate = toLectures["certicate"]!
                
                DispatchQueue.main.async(execute: {
                    self.reloadData()
                    print(self.duty, "kisung helel2")
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
                
                print("function started2")
                self.dbGetMyLecturesFromMainLectures(e_num: e_num, fromLectures: lectureResult)
                if ((task.error) != nil) {
                    print("Error: \(String(describing: task.error))")
                }
                
            }
            
            return nil
        })
    }

    var once = false
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        if !once {
            dbGetMainLectures(e_num: 1100012)
        }
        self.once = true
        print("collectionView2")
        
        //let getDataFromHome = HomeTableViewController()
        //let etc = getDataFromHome.setSampleRecentData()
        
        //print(etc)
        
//        for i in 0..<6 {
//            print(i)
//
//            var temp_titles = [String]()
//            var temp_imgUrls = [URL]()
//            var temp_videoRates = [CGFloat]()
//            var temp_videoTimes = [Int]()
//
//            var temp_contents = [String]()
//            var temp_favorites = [Bool]()
//
//
//            for j in 0..<10 {
//                print(j)
//
//                temp_titles.append(totalData[j])
//                temp_titles.append(etc[j]._L_name!)
//                temp_imgUrls.append(URL(string: etc[j]._L_link_img!)!)
//                temp_videoRates.append(CGFloat(Int(etc[j]._U_length!) / Int(etc[j]._L_length!)))
//                temp_videoTimes.append(Int(etc[j]._L_length!))
//
//                temp_contents.append("Today let's talk about salaries and how much money you can make as an iOS / Android Engineer out in the Bay Area / Silicon Valley.")
//                temp_favorites.append(etc[j]._J_status as! Bool)
//
//            }
//
//            titles.append(temp_titles)
//            imgurls.append(temp_imgUrls)
//            videoRates.append(temp_videoRates)
//            videoTimes.append(temp_videoTimes)
//
//            contents.append(temp_contents)
//            favorites.append(temp_favorites)
//        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var collectionRow = collectionView.tag-2
        var length = 0
        
        if collectionRow == 0 {
            length = duty.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 1 {
            length = new.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 2 {
            length = famous.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 3 {
            length = care.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 4 {
            length = develop.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 5 {
            length = finance.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 6 {
            length = culture.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 7 {
            length = english.count
            if length > 10 {
                length = 10
            }
        } else if collectionRow == 8 {
            length = certicate.count
            if length > 10 {
                length = 10
            }
        }
        
        print("lllllllength: \(collectionRow)   \(length)")
        
        return length
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var row = indexPath.row
        var collectionRow = collectionView.tag-2
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3CollectionViewCell", for: indexPath) as! Home3CollectionViewCell
        
        
        print("morning3", duty)
        if duty.count == 0 {
            print("morning test2")
            print(duty)
            print(new)
            print(famous)
            return cell
        }
        
        
        
        if collectionRow == 0 {
            var item = duty[indexPath.row]
            print("morning test", item)
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
        } else if collectionRow == 1 {
            var item = new[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 2 {
            var item = famous[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 3 {
            var item = care[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 4 {
            var item = develop[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 5 {
            var item = finance[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 6 {
            var item = culture[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 7 {
            var item = english[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        } else if collectionRow == 8 {
            var item = certicate[indexPath.row]
            if type(of: item) == My_Lec_List.self {
                let data = item as! My_Lec_List
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(data._U_length!)
                
            } else {
                let data = item as! LECTURE
                cell.lblTitle.text = data._L_name
                cell.imgVideo.downloadImage(from: URL(string: data._L_link_img!)!)
                videoRates = CGFloat(0)
            }
            
        }
        
//        cell.lblTitle.text = titles[collectionRow][row]
//
//        cell.imgVideo.downloadImage(from: imgurls[collectionRow][row])
//        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
//
//        cell.lblVideoTime.text = timeIntToString(from: videoTimes[collectionRow][row])

        
        return cell
    }

}
