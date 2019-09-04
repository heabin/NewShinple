//
//  EMPLOYEE.swift
//  Shinple
//
//  Created by user on 28/08/2019.
//  Copyright © 2019 veronica. All rights reserved.

import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class EMPLOYEE: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Corporation_Name : String?
    var _Department : String?
    var _Employee_Name : String?
    var _Employee_Number : NSNumber?
    var _Employee_Position : String?
    var _Headquarter : String?
    var _ID : String?
    var _Phone_Number : NSNumber?
    var _PW : String?
    
    
    class func dynamoDBTableName() -> String {
        return "EMPLOYEE"
    }

    class func hashKeyAttribute() -> String {
        return "_Employee_Number"
    }

    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Index" : "Index",
            "_Attendance" : "Attendance",
            "_Corporation_Name" : "Corporation_Name",
            "_Department" : "Department",
            "_Employee_Name" : "Employee_Name",
            "_Employee_Number": "Employee_Number",
            "_Employee_Position" : "Employee_Position",
            "_Headquarter" : "Headquarter",
            "_ID" : "ID",
            "_Phone_Number" : "Phone_Number",
            "_PW" : "PW"
        ]
    }

}
//func createEmployee() {
//
//    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//
//    let EmItem: EMPLOYEE = EMPLOYEE()
//
//    EmItem._Employee_Number = 7777
//    EmItem._Index = 3333
//    EmItem._Department = "AA"
// var _My_List : Any?
// EmItem._My_List = ["s" : ["3" : ["1":"2","4":"3"]]]
//
//    dynamoDbObjectMapper.save(EmItem, completionHandler: {
//
//        (error: Error?) -> Void in
//
//        if let error = error {
//            print("Amazon DynamoDB Save Error: \(error)")
//            return
//        }
//        print("An item was saved.")
//    })
//}

//
//func queryEMPLOYEE() {
//
//
//
//    // 1) Configure the query
//    let queryExpression = AWSDynamoDBQueryExpression()
//    queryExpression.expressionAttributeNames = [
//        "_Corporation_Name" : "DS"
//    ]
//
//    // 2) Make the query
//    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//
//
//
//    dynamoDbObjectMapper.query(EMPLOYEE.self, expression: queryExpression) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
//        if error != nil {
//            print("The request failed. Error: \(String(describing: error))")
//        }
//        if output != nil {
//            for EMPLOYEe in output!.items {
//                let EMPLOYEEItem = EMPLOYEe as? EMPLOYEE
//                print("\(EMPLOYEEItem!)")
//            }
//        }
//
//    }
//
//}
