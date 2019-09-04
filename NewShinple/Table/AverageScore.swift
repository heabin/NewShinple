
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class AverageScore: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Index : NSNumber?
    var _Department : String?
    var _Emp_num : NSNumber?
    var _Lec_name : String?
    var _Lec_num : NSNumber?
    var _Rate : NSNumber?
    var _S_cate : String?
    var _U_id : String?
    
    
    class func dynamoDBTableName() -> String {
        return "AverageScore"
    }
    
    class func hashKeyAttribute() -> String {
        return "_Index"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Index" : "Index",
            "_Department" : "Department",
            "_Emp_num" : "Emp_num",
            "_Lec_name" : "Lec_name",
            "_Lec_num" : "Lec_num",
            "_Rate": "Rate",
            "_S_cate" : "S_cate",
            "_U_id" : "U_id"
        ]
    }
    
}
