////
////  STATICS.swift
////  Shinple
////
////  Created by user on 28/08/2019.
////  Copyright © 2019 veronica. All rights reserved.
////
//
//import Foundation
//import UIKit
//import AWSDynamoDB
//import AWSAuthCore
//
//
//@objcMembers
//class EMPLOYEE: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
//
//    var _Index: NSNumber?
//    var _Board : [String: NSNumber]?
//    var _Corporation_Name : String?
//    var _Department : String?
//    var _Employee_Name : String?
//    var _Employee_Number : NSNumber?
//    var _Employee_Position : String?
//    var _Headquarter : String?
//    var _ID : String?
//
//    var _My_List : Any?
//    var _my_lecture : String?
//
//    var _cong : [String : Any]?
//
//
//    var _Phone_Number : NSNumber?
//    var _PW : String?
//    var _Score : [String : NSNumber]?
//
//    class func dynamoDBTableName() -> String {
//        return "EMPLOYEE"
//    }
//
//    class func hashKeyAttribute() -> String {
//        return "_Employee_Number"
//    }
//
//    class func rangeKeyAttribute() -> String {
//        return "_Index"
//    }
//
//    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
//        return [
//            "_Index" : "Index",
//            "_Attendance" : "Attendance",
//            "_Corporation_Name" : "Corporation_Name",
//            "_Department" : "Department",
//            "_Employee_Name" : "Employee_Name",
//            "_Employee_Number": "Employee_Number",
//            "_Employee_Position" : "Employee_Position",
//            "_Headquarter" : "Headquarter",
//            "_ID" : "ID",
//            "_My_List" : "My_List",
//            "_Phone_Number" : "Phone_Number",
//            "_PW" : "PW",
//            "_Score" : "Score",
//            "_cong" : "cong"
//        ]
//    }
//
//}
