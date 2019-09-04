
import Foundation
import UIKit
import AWSDynamoDB

class Books: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    @objc var _isbn: String?
    @objc var _category: String?
    @objc var _author: String?
    @objc var _title: String?
    
    class func dynamoDBTableName() -> String {
        return "Books"
    }
    
    class func hashKeyAttribute() -> String {
        return "_isbn"
    }
    
    class func rangeKeyAttribute() -> String {
        return "_category"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_isbn" : "ISBN",
            "_category" : "Category",
            "_author" : "Author",
            "_title" : "Title",
        ]
}
}

func createBooks() {
    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
    
    let booksItem: Books = Books()
    
    booksItem._isbn = "1234"
    booksItem._category = "History"
    booksItem._author = "Harriet Tubman"
    booksItem._title = "My Life"
    
    //Save a new item
    dynamoDbObjectMapper.save(booksItem, completionHandler: {
        (error: Error?) -> Void in
        
        if let error = error {
            print("Amazon DynamoDB Save Error: \(error)")
            return
        }
        print("An item was saved.")
    })
}

//func queryBooks() {
//    
//    // 1) Configure the query
//    let queryExpression = AWSDynamoDBQueryExpression()
//    queryExpression.keyConditionExpression = "#isbn = :ISBN AND #category = :Category"
//    
//    queryExpression.expressionAttributeNames = [
//        "#isbn": "ISBN",
//        "#category": "Category"
//    ]
//    
//    queryExpression.expressionAttributeValues = [
//        ":ISBN" : "1234",
//        ":Category" : "History"
//    ]
//    
//    // 2) Make the query
//    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//    
//    dynamoDbObjectMapper.query(Books.self, expression: queryExpression) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
//        if error != nil {
//            print("The request failed. Error: \(String(describing: error))")
//        }
//        if output != nil {
//            for books in output!.items {
//                let booksItem = books as? Books
//                print("\(booksItem!._title!)")
//            }
//        }
//    }
//}
