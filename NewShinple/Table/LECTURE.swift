import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class LECTURE: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Lecture_num: NSNumber?
    var _Duty : NSNumber?
    var _E_date : String?
    var _L_cate : String?
    var _L_content : String?
    var _L_link_img : String?
    var _L_link_video : String?
    var _L_name : String?
    var _L_rate : NSNumber?
    var _L_teacher : String?
    var _S_cate : String?
    var _S_cate_num : NSNumber?
    var _U_date : String?
    var _L_length : NSNumber?
    var _L_count : NSNumber?
    var _L_rate_user : NSNumber?
    
    
    
    
    class func dynamoDBTableName() -> String {
        return "LECTURE"
    }
    
    class func hashKeyAttribute() -> String {
        return "_Lecture_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Lecture_num" : "Lecture_num",
            "_E_date" : "E_date",
            "_Duty" : "Duty",
            "_L_cate" : "L_cate",
            "_L_content" : "L_content",
            "_L_link_img": "L_link_img",
            "_L_link_video" : "L_link_video",
            "_L_name" : "L_name",
            "_L_rate" : "L_rate",
            "_L_teacher" : "L_teacher",
            "_S_cate" : "S_cate",
            "_S_cate_num" : "S_cate_num",
            "_U_date" : "U_date",
            "_L_length" : "L_length",
            "_L_count" : "L_count",
            "_L_rate-user" : "L_rate-user"
        ]
    }
    
}
