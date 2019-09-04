
import Foundation
import UIKit
import AWSDynamoDB
import AWSAuthCore


@objcMembers
class OrganizationChart: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _CompanyName: String?
    var _Headquarter : Any?
    
    class func dynamoDBTableName() -> String {
        return "OrganizationChart"
    }
    
    class func hashKeyAttribute() -> String {
        return "CompanyName"
    }
    
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_CompanyName" : "CompanyName",
            "_Headquarter" : "Headquarter"
        ]
    }
    
}

func createOrgan() {
    
    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
    
    let OrganItem: OrganizationChart = OrganizationChart()
    
    OrganItem._CompanyName = "wowowowow"
    OrganItem._Headquarter = ["ww"]
    
    
    dynamoDbObjectMapper.save(OrganItem, completionHandler: {
        
        (error: Error?) -> Void in
        
        if let error = error {
            print("Amazon DynamoDB Save Error: \(error)")
            return
        }
        print("An item was saved.")
    })
}
