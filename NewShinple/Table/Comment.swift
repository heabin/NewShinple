import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers
class Comment: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _C_num: NSNumber?
    var _C_content : String?
    var _C_date : String?
    var _L_num : NSNumber?
    var _U_id : String?
    
    
    class func dynamoDBTableName() -> String {
        return "Comment"
    }
    
    class func hashKeyAttribute() -> String {
        return "_C_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_C_num" : "C_num",
            "_C_content" : "C_content",
            "_C_date" : "C_date",
            "_L_num" : "L_num",
            "_U_id" : "U_id"
        ]
    }
    
}

