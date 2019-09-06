//
//  CategoryTableViewController.swift
//  NewShinple
//
//  Created by user on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AWSDynamoDB


protocol selectCategoryDelegate {
    func selectFirstCategory(_ controller: CategoryTableViewController, message: String)
    func selectSecondCatogory(_ controller: CategoryTableViewController, message: String)
}

class CategoryTableViewController: UITableViewController {
    
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    var category = [""]
    var delegate : selectCategoryDelegate?
    
    var buttonNum:Int = 0
    
//    var care = [Any]()
//    var develop = [Any]()
//    var finance = [Any]()
//    var culture = [Any]()
//    var english = [Any]()
//    var certicate = [Any]()
//
//    func dbGetMyLecturesFromMainLectures(e_num:NSNumber, fromLectures:[String:[Any]]) {
//        var toLectures = [String:[Any]]()
//        let scanExpression = AWSDynamoDBScanExpression()
//        scanExpression.filterExpression = "E_num = :E_num"
//        scanExpression.projectionExpression = "My_num, C_status, Duty, E_date, E_num, J_status, L_length, L_link_img, L_link_video, L_name, Lecture_num, S_cate_num, U_length, W_date"
//        scanExpression.expressionAttributeValues = [":E_num":Int(truncating: e_num)]
//        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//        dynamoDbObjectMapper.scan(My_Lec_List.self, expression: scanExpression).continueWith(block: { (task:AWSTask!) -> AnyObject? in
//            if task.result != nil {
//                let paginatedOutput = task.result! as AWSDynamoDBPaginatedOutput
//                for item in paginatedOutput.items as! [My_Lec_List] {
//                    for key in fromLectures.keys {
//                        if fromLectures[key] == nil {
//                            toLectures[key] = fromLectures[key]
//                            continue
//                        }
//                        var temp = [Any]()
//                        for data in fromLectures[key]! {
//                            if (data as AnyObject)._Lecture_num == item._Lecture_num {
//                                temp.append(item)
//                            } else {
//                                temp.append(data)
//                            }
//                        }
//                        toLectures[key] = temp
//                    }
//                }
//                print("resolved item2....", toLectures)
//
//
//
//                DispatchQueue.main.async(execute: {
//
//                    print("eunchae103")
//                    self.develop = toLectures["develop"]!
//                    self.finance = toLectures["finance"]!
//                    self.culture = toLectures["culture"]!
//                    self.english = toLectures["english"]!
//                    self.certicate = toLectures["certicate"]!
//                    print("end-eunchae103")
//                    print(self.develop, "kisung helel3")
//                })
//
//
//            }
//            if ((task.error) != nil) {
//                print("Error: \(String(describing: task.error))")
//            }
//            return nil
//        })
//    }
//
//    func dbGetMainLectures(e_num:NSNumber) {
//        func parseListData(beforeParsed:NSArray) -> [String] {
//            var parsed: [String] = []
//            for item in beforeParsed {
//                parsed.append(item as! String)
//            }
//            return parsed
//        }
//        let scanExpression = AWSDynamoDBScanExpression()
//        scanExpression.filterExpression = "Lecture_num > :Lecture_num"
//        scanExpression.projectionExpression = "Lecture_num, E_date, L_cate, Duty, L_content, L_length, L_link_img, L_link_video, L_name, L_rate, L_teacher, S_cate, S_cate_num, U_date, L_count"
//        scanExpression.expressionAttributeValues = [":Lecture_num":0]
//        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//        print("debug0_kisung")
//        dynamoDbObjectMapper.scan(LECTURE.self, expression: scanExpression).continueWith(block: { (task:AWSTask!) -> AnyObject? in
//            if task.result != nil {
//                var lectureResult = [String:[Any]]()
//                print("debug1_kisung")
//                let paginatedOutput = task.result! as AWSDynamoDBPaginatedOutput
//                var lectureFamous = [Any]()
//                var lectureNew = [Any]()
//                var lectureDuty = [Any]()
//                var lectureCare = [Any]()
//                var lectureDevelop = [Any]()
//                var lectureCulture = [Any]()
//                var lectureEnglish = [Any]()
//                var lectureCerticate = [Any]()
//                var lectureFinance = [Any]()
//
//                var indexAry = [Double]()
//
//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy-MM-dd"
//                let today = Date()
//                for item in paginatedOutput.items as! [LECTURE] {
//                    let upload = formatter.date(from: item._U_date!)
//                    let interval = upload?.timeIntervalSince(today) as! Double
//                    var inserted = false
//                    var index = 0
//                    for indexItem in indexAry {
//                        if interval >= indexItem {
//                            lectureNew.insert(item, at: index)
//                            indexAry.insert(interval, at: index)
//                            inserted = true
//                            break
//                        }
//                        index += 1
//                    }
//                    if !inserted {
//                        lectureNew.append(item)
//                        indexAry.append(interval)
//                    }
//
//                    index = 0
//                    inserted = false
//                    for famous in lectureFamous {
//                        if item._L_count?.intValue ?? 0 >= (famous as AnyObject)._L_count?.intValue ?? 0 {
//                            lectureFamous.insert(item, at:index)
//                            inserted = true
//                            break
//                        }
//                        index += 1
//                    }
//                    if !inserted {
//                        lectureFamous.append(item)
//                    }
//                }
//
//                for item in lectureNew as! [LECTURE] {
//                    if item._Duty == 1 {
//                        lectureDuty.append(item)
//                    }
//                    switch(item._L_cate) {
//                    case "Care":
//                        lectureCare.append(item)
//                        break
//                    case "develop":
//                        lectureDevelop.append(item)
//                        break
//                    case "Finanace":
//                        lectureFinance.append(item)
//                        break
//                    case "Culture":
//                        lectureCulture.append(item)
//                        break
//                    case "English":
//                        lectureEnglish.append(item)
//                        break
//                    case "Certicate":
//                        lectureCerticate.append(item)
//                        break
//                    default:
//                        break
//                    }
//                }
//                lectureResult["duty"] = lectureDuty
//                lectureResult["new"] = lectureNew
//                lectureResult["famous"] = lectureFamous
//                lectureResult["care"] = lectureCare
//                lectureResult["develop"] = lectureDevelop
//                lectureResult["finance"] = lectureFinance
//                lectureResult["culture"] = lectureCulture
//                lectureResult["english"] = lectureEnglish
//                lectureResult["certicate"] = lectureCerticate
//
//                print("function started2")
//                self.dbGetMyLecturesFromMainLectures(e_num: e_num, fromLectures: lectureResult)
//                if ((task.error) != nil) {
//                    print("Error: \(String(describing: task.error))")
//                }
//
//            }
//
//            return nil
//        })
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("First")
        //dbGetMainLectures(e_num: 1100012)
        
        
        self.tableView.backgroundColor = colorLightGray

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return category.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.btnCategory.tintColor = .darkGray
        cell.btnCategory.setTitle(category[indexPath.row], for: .normal)
        cell.btnCategory.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)

        
        return cell
    }
    

    
    
    @objc func goToMainPage(_ sender: UIButton) {
        
        sender.setTitleColor(colorEndBlue, for: .normal)
        if buttonNum == 0 {
            if delegate != nil {
                print("대분류 선택 / buttonNum = 0")
                print(sender.currentTitle!)
                delegate?.selectFirstCategory(self, message: sender.currentTitle!)
            }
        }else if buttonNum == 1 {
            if delegate != nil {
                print("소분류 선택 / buttonNum = 1")
                delegate?.selectSecondCatogory(self, message: sender.currentTitle!)
            }
        }else {
            print("EEEEEEEEEEEEEEEError")
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
  

}

