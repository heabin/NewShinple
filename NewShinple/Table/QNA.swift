//수정


import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers
class QNA: AWSDynamoDBObjectModel, AWSDynamoDBModeling {

    var _Index: NSNumber?
    var _Board : Any?
   
    class func dynamoDBTableName() -> String {
        return "QNA"
    }

    class func hashKeyAttribute() -> String {
        return "_Index"
    }


    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_Index" : "Index",
            "_Board" : "Board"
        ]
    }

}

func createQNA_Que() {

    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()

    let QueItem: QNA = QNA()
    QueItem._Index = 6
    QueItem._Board = ["Answer" : ["B_ans_cate" : "1", "B_ans_check" : "2", "B_ans_cont" : "3", "B_ans_date" : "4",  "B_ans_id" : "5", "B_ans_tit" : "6"],"Qusetion" : ["B_cate" : "1", "B_cont" : "2", "B_date" : "3", "B_id" : "4",  "B_tit" : "5"]]
        
        
        
    dynamoDbObjectMapper.save(QueItem, completionHandler: {

        (error: Error?) -> Void in

        if let error = error {
            print("Amazon DynamoDB Save Error: \(error)")
            return
        }
        print("An item was saved.")
    })
}
//


func createAns_Que() {
    
    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
    
    let AnsItem: QNA = QNA()
    AnsItem._Index = 6
    AnsItem._Board = ["Qusetion" : ["B_cate" : "1", "B_cont" : "2", "B_date" : "3", "B_id" : "4",  "B_tit" : "5"]]
    
    
    
    dynamoDbObjectMapper.save(AnsItem, completionHandler: {

        (error: Error?) -> Void in

        if let error = error {
            print("Amazon DynamoDB Save Error: \(error)")
            return
        }
        print("An item was saved.")
    })
}


