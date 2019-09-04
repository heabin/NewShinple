//
//
//  connectDB.swift
//  connectDb
//
//  Created by user on 28/08/2019.
//  Copyright © 2019 bg. All rights reserved.

import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore

@objcMembers
class connectDb: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _userId: String?
    var _category: String?
    var _kt: [String: String]?
    var _1: [String: String]?
    var _2: [String: [String: String]]?
    
    class func dynamoDBTableName() -> String {
        return "connectDb"
    }
    
    class func hashKeyAttribute() -> String {
        return "_userId"
    }
    
    class func rangeKeyAttribute() -> String {
        return "_category"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_userId" : "userId",
            "_category" : "category",
            "_kt" : "kt"
            
        ]
    }
    
}

func createConnectDb() {
    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
    
    let dBItem: connectDb = connectDb()
    
    let arraytest3 = ["1": "3","2":"4"]
    
    dBItem._userId = "1234"
    dBItem._category = "History"
    dBItem._kt = arraytest3
    
    dynamoDbObjectMapper.save(dBItem, completionHandler: {
        (error: Error?) -> Void in
        
        if let error = error {
            print("Amazon DynamoDB Save Error: \(error)")
            return
        }
        print("An item was saved.")
    })
}

