
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class ANSWER: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _A_num : NSNumber?
    var _A_cate : String?
    var _A_content : String?
    var _A_date : String?
    var _Q_id : String? // need to insert field
    var _A_time : String?
    var _A_tit : String?
    
    class func dynamoDBTableName() -> String {
        return "ANSWER"
    }
    
    class func hashKeyAttribute() -> String {
        return "_A_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_A_num" : "A_num",
            "_A_cate" : "A_cate",
            "_A_content" : "A_content",
            "_A_date" : "A_date",
            "_Q_id": "Q_id",
            "_A_time" : "A_time",
            "_A_tit" :"A_tit",
        ]
    }
    
}
