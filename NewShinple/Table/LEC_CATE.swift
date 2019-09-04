
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers
class LEC_CATE: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _LECTURE: String?
    var _개발 : Any?
    var _금융 : Any?
    var _문화 : Any?
    var _외국어 : Any?
    var _육아 : Any?
    var _자격증 : Any?
    var _필수 : Any?
    
    
    class func dynamoDBTableName() -> String {
        return "LEC_CATE"
    }
    
    class func hashKeyAttribute() -> String {
        return "_LECTURE"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_LECTURE" : "LECTURE",
            "_개발" : "개발",
            "_금융" : "금융",
            "_문화" : "문화",
            "_외국어" : "외국어",
            "_육아": "육아",
            "_자격증" : "자격증",
            "_필수" : "필수"
        ]
    }
    
}

func queryLEC_CATE() {
    let queryExpression1 = AWSDynamoDBQueryExpression()
    
    queryExpression1.scanIndexForward = 1

    
    
    
    // 2) Make the query
    let dynamoDbObjectMapper2 = AWSDynamoDBObjectMapper.default()
    
    dynamoDbObjectMapper2.query(LEC_CATE.self, expression: queryExpression1) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
  //      print(output)
        if error != nil {
            print("The request failed. Error: \(String(describing: error))")
        }
        if output != nil {
            for cate in output!.items {
                let cateItem = cate as? LEC_CATE
               print(cateItem)
            
                let t = type(of: cateItem)
                print("\(t)")
            }
        }
        
    }
    
}


