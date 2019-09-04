import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers


class Home_Need_Listen: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _Index: NSNumber?
    var _D_date : String?
    var _Emp_num : NSNumber?
    var _L_cate : String?
    var _Lec_name : String?
    var _Lec_num : NSNumber?
    var _S_cate : String?
    var _Status : NSNumber?
    
    class func dynamoDBTableName() -> String {
        return "Home_Need_Listen"
    }
    
    class func hashKeyAttribute() -> String {
        return "_Index"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        
        return [
            "_Index" : "Index",
            "_D_date" : "D_date",
            "_Emp_num" : "Emp_num",
            "_L_cate" : "L_cate",
            "_Lec_name" : "Lec_name",
            "_Lec_num" : "Lec_num",
            "_S_cate" : "S_cate",
            "_Status" : "Status"
        ]
    }
    
}
