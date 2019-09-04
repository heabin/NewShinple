import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers
class My_Lec_List: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _My_num : NSNumber?
    var _E_num : NSNumber?
    var _C_status : NSNumber?
    var _J_status : NSNumber?
    var _L_length : NSNumber?
    var _L_link_img : String?
    var _L_link_video : String?
    var _L_name : String?
    var _Lecture_num : NSNumber?
    var _S_cate_num : NSNumber?
    var _U_length : NSNumber?
    var _W_date : String?
    var _L_content : String?
    var _E_date : String?
    var _Duty : NSNumber?
    
    class func dynamoDBTableName() -> String {
        return "My_Lec_List"
    }
    
    class func hashKeyAttribute() -> String {
        return "_My_num"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_My_num" : "My_num",
            "_E_num" : "E_num",
            "_C_status" : "C_status",
            "_J_status" : "J_status",
            "_L_length" : "L_length",
            "_L_link_img" : "L_link_img",
            "_L_link_video" : "L_link_video",
            "_L_name" : "L_name",
            "_Lecture_num" : "Lecture_num",
            "_S_cate_num" : "S_cate_num",
            "_U_length" : "U_length",
            "_W_date" : "W_date",
            "_E_date" : "E_date",
            "_Duty" : "Duty",
            "_L_content" : "L_content"
        ]
    }
    
}

