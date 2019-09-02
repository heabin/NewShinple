////
////  Query.swift
////  Shinple
////
////  Created by 김기성 on 30/08/2019.
////  Copyright © 2019 veronica. All rights reserved.
////
//
import Foundation
import AWSDynamoDB


// MARK: Category
/*
 - MARK: UPDATE
 1. 시청기록 갱신] func dbUpdateLectureWatched() -> {}
 :: Employee -> Lecture 시청기록 갱신,
 :: (IF)필수강의일경우 새 테이블(필수강의 시청기록: 가명) -> Employee에 해당하는 것들(insert or update)
 
 2. 찜 기록 생성/갱신 func dbAddJjim() -> {}
 :: Employee -> Lecture 찜한 동영상(insert)
 :: 새 테이블(찜 기록: 가명) -> Employee에 해당하는 것들 생성(insert)
 
 3. 평점 기록 갱신 func dbAddRate() -> {}
 :: 새 테이블(평점 기록: 가명) -> 평가한 기록이 없을 경우 반영
 
 4. 댓글 달기 func dbAddComment() -> {}
 :: Lecture -> Comment기록 추가
 
 - MARK: SELECT
 1. Home
 :  func dbGetLecCate() -> [String:String] {}
 :: 1.1 LEC_CATE -> 대분류 및 소분류 Select로
 
 :  func dbGetMainLectures() -> {
 dbGetLecCate()
 }
 :: 1.2 강의(대분류) 10개 -> LEC_CATE => Lecture -> 현재 날짜와 가까운 10개
 :: 1.2 인기강의 -> Lecture(!필수) 시청기록 Count 높은 TOP10
 :: 신규강의 -> Lecture등록날짜 기준 현재 날짜와 가까운 10개
 :: 필수강의 -> Lecture(필수) 기준 현재 날짜와 가까운 10개
 
 :  func dbGetRecentLectures(type: [String]) -> {}
 :: 1.3 최근시청 강의 -> Employee -> Lecture : 시청중인 동영상(최대 10개, 마지막 갱신시각이랑 가까운)
 
 1-6. 알림함
 :  func dbGetAlertNotice() -> {}
 :: Notice -> 필수강의가 신규로 올라왔을 때
 :  func dbGetAlertNecessaryLecture() -> {}
 :: Employee -> D-day가 얼마 안남았는데 안봤을때
 
 1-2. Search
 :  func dbGetLecCate() -> {}
 :: 1.1과 같음
 
 3. MyList
 :  func dbGetRecentLectures(type: [String]) -> {}
 :: 1.3과 같음
 :: 3.1 최근시청 강의 -> Employee -> Lecture : 시청중인 동영상(모두), 시청완료 동영상(모두), 찜목록(모두), 필수강의(시청안한 것들을 위로, 그 다음부터는 모두)
 
 4. VideoDetail
 :  func dbGetLectureDetail() -> {}
 :: 4.1 Lecture -> 모든 정보
 
 5. QnA
 :  func dbGetQuestion() -> {}
 :: QnA -> Employee에 해당하는 QnA보여주기
 
 
 - MARK: DELETE
 1. 찜 기록 삭제 func dbDeleteJjim() -> {}
 :: 새 테이블(찜 기록: 가명) -> Employee에 해당하는 것들 생성(delete)
 
 */




//func parseListData(beforeParsed:NSArray) -> [String] {
//    var parsed: [String] = []
//    for item in beforeParsed {
//        parsed.append(item as! String)
//    }
//    return parsed
//}
//
//
//
//
//func initQueryExpression() -> AWSDynamoDBQueryExpression {
//    let queryExpression = AWSDynamoDBQueryExpression()
//    queryExpression.expressionAttributeNames = [String:String]()
//    queryExpression.expressionAttributeValues = [String:Any]()
//    return queryExpression
//}
//
//func dbUpdateLectureWatched() {
//
//}
//
//func dbAddJjim() {
//
//}
//
//func dbAddRate() {
//
//}
//
//func dbAddComment() {
//
//}
//
//func dbGetLecCate() -> [String:Any]? {
//    let queryExpression = initQueryExpression()
//    queryExpression.keyConditionExpression = "#LECTURE = :lecture"
//    queryExpression.expressionAttributeNames = ["#LECTURE":"LECTURE"]
//    queryExpression.expressionAttributeValues = [":lecture":"lecture"]
//    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//
//    var returnCategory: [String:Any] = [:]
//    dynamoDbObjectMapper.query(LEC_CATE.self, expression: queryExpression) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
//        if error != nil {
//            print("The request failed. Error: \(String(describing: error))")
//        }
//        if output != nil {
//            let data = output!.items.self[0] as! LEC_CATE
//            returnCategory["Care"] = parseListData(beforeParsed:data._Care as! NSArray)
//            returnCategory["Develop"] = parseListData(beforeParsed:data._develop as! NSArray)
//            returnCategory["Culture"] = parseListData(beforeParsed:data._Culture as! NSArray)
//            returnCategory["English"] = parseListData(beforeParsed:data._English as! NSArray)
//            returnCategory["Certicate"] = parseListData(beforeParsed:data._Certicate as! NSArray)
//            returnCategory["Duty"] = parseListData(beforeParsed:data._Duty as! NSArray)
//            returnCategory["Finance"] = parseListData(beforeParsed:data._Finance as! NSArray)
//            print(returnCategory, "b")
//        }
//    }
//    print(returnCategory, "a")
//    return nil
//}
//
//func dbGetMainLectures() {
//    dbGetLecCate()
//}
//
//func dbGetRecentLectures(type: [String]) {
//
//}
//
//func dbGetAlertNotice() {
//
//}
//
//func dbGetAlertNecessaryLecture() {
//
//}
//
//func dbGetLectureDetail() {
//
//}
//
//func dbGetQuestion() {
//
//}
//
//func dbDeleteJjim() {
//
//}
//
//func testQueryEmployee(whereQuery: [String:Any], operatorText: [String]) {
//    // MARK: ASYNC문제 해결해야함!!!!!!
//    let queryExpression = AWSDynamoDBQueryExpression()
//    let keys = whereQuery.keys
//    queryExpression.expressionAttributeNames = [String:String]()
//    queryExpression.expressionAttributeValues = [String:Any]()
//    var expression = ""
//    var index = 0
//    for key in keys {
//        let key1 = "#"+key
//        let key2 = ":"+key
//        expression = key1+" "+operatorText[index]+" "+key2+" "
//        queryExpression.expressionAttributeNames?[key1] = key
//        queryExpression.expressionAttributeValues?[key2] = whereQuery[key]
//        index += 1
//        print(key)
//    }
//
//
//    queryExpression.keyConditionExpression = expression
//    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
//    dynamoDbObjectMapper.query(EMPLOYEE.self, expression: queryExpression) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
//        if error != nil {
//            print("The request failed. Error: \(String(describing: error))")
//        }
//        if output != nil {
//            print(output!.items)
//            for employee in output!.items {
//                let employeeItem = employee as? EMPLOYEE
//                var dict:NSDictionary = employeeItem!._My_List as! NSDictionary
//                var dic2 = dict.value(forKey: "my_lecture") as! NSDictionary
//                print(dic2.allValues, dic2.allValues[2])
//            }
//        }
//    }
//}










//
////func queryLEC_CATE() {
////
////    // 1) Configure the query
////    let queryExpression1 = AWSDynamoDBQueryExpression()
////    queryExpression1.keyConditionExpression = "#Lecture = :Lecture"
////
////    print(queryExpression1.keyConditionExpression)
////
////    queryExpression1.expressionAttributeNames = [
////        "#Lecture": "Lecture",
////    //    "#개발": "개발"
////    ]
////    queryExpression1.expressionAttributeValues = [
////        ":Lecture" : "lecture",          //바뀐 부분 이제 쿼리문 일단은 먹힐꺼야
////    //    ":개발" : ("C","JAVA","Python","HTML","CSS")
////    ]
////
////    // 2) Make the query
////    let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
////
////    dynamoDbObjectMapper.query(LEC_CATE.self, expression: queryExpression1) { (output: AWSDynamoDBPaginatedOutput?, error: Error?) in
////        print(output)
////        if error != nil {
////            print("The request failed. Error: \(String(describing: error))")
////        }
////        if output != nil {
////            print(output!.items)
////            for cate in output!.items {
////                let cateItem = cate as? LEC_CATE
////                print(type(of:cateItem!._금융))
////                var dict:NSDictionary = cateItem!._금융 as! NSDictionary
////                print(dict.allKeys)
////
////            }
////        }
////
////    }
////
////}
