
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class Question : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Q_num : NSNumber?
    var _Q_cate : String?
    var _Q_check : NSNumber?
    var _Q_content : String?
    var _Q_date : String?
    var _Q_id : String?
    var _Q_time : String?
    var _Q_tit : String?
    
    class func dynamoDBTableName() -> String {
        return "Question"
    }
    
    class func hashKeyAttribute() -> String {
        return "_Q_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Q_num" : "Q_num",
            "_Q_cate" : "Q_cate",
            "_Q_check" : "Q_check",
            "_Q_content" : "Q_content",
            "_Q_date" : "Q_date",
            "_Q_id" : "Q_id",
            "_Q_time": "Q_time",
            "_Q_tit" : "Q_tit"
        ]
    }
    
}
