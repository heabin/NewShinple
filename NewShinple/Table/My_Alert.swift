
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class My_Alert : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Alert_num : NSNumber?
    var _E_date_left : NSNumber?
    var _L_status : NSNumber?
    var _Lecture_num : NSNumber?
    var _N_num : NSNumber?
    var _Noti_cate : String?
    var _Noti_content : String?
    var _Noti_date : String?
    var _S_status : NSNumber?
    var _User_id : String?
    
    class func dynamoDBTableName() -> String {
        return "My_Alert"
    }
    
    class func hashKeyAttribute() -> String {
        return "_Alert_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Alert_num" : "Alert_num",
            "_E_date_left" : "E_date_left",
            "_L_status" : "L_status",
            "_Lecture_num" : "Lecture_num",
            "_N_num" : "N_num",
            "_Noti_cate": "Noti_cate",
            "_Noti_content" : "Noti_content",
            "_Noti_date" : "Noti_date",
            "_S_status" : "S_status",
            "_User_id" : "User_id"
        ]
    }
    
}
