//
//  Home3CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AWSDynamoDB

class Home3CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // for 메인 페이지
    var titles = [[String]]()
    var imgurls = [[URL]]()
    var videoRates = [[CGFloat]]()
    var videoTimes = [[Int]]()
    
    var titles_duty = [String]()
    var titles_famous = [String]()
    var titles_new = [String]()
    var titles1 = [String]()
    var titles2 = [String]()
    var titles3 = [String]()
    var titles4 = [String]()
    var titles5 = [String]()
    var titles6 = [String]()
    
    var imgurls_duty = [URL]()
    var imgurls_famous = [URL]()
    var imgurls_new = [URL]()
    var imgurls1 = [URL]()
    var imgurls2 = [URL]()
    var imgurls3 = [URL]()
    var imgurls4 = [URL]()
    var imgurls5 = [URL]()
    var imgurls6 = [URL]()

    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        
        //["전체", "1개발", "2금융", "3문화", "4외국어", "5육아", "6자격증"]
        titles_duty = ["제1강. 모두가 함께하는 나침반 안전교육 시리즈",
                       "제2강. 모두가 함께하는 나침반 안전교육 시리즈",
                       "제1강. 장애인식개선교육 '버디&키디'",
                       "제2강. 장애인식개선교육 '버디&키디'",
                       "제3강. 장애인식개선교육 '버디&키디'"]
        titles_famous = ["제1강. 회사에서하는 유산소운동 다이어트",
                         "제1강. AWS클라우드 이해하기",
                         "제1강. 펀드, 모른다면 이것만 해라!",
                         "제2강. 펀드, 모른다면 이것만 해라!",
                         "제3강. 문과도 쉽게 학습하는 ADsP"]
        titles_new = ["제3강. 백종원의 요리비책",
                      "제1강. 중국어 3달만에 귀가 트이는 법",
                      "제1강. 스페인여행 기초회화",
                      "제2강. 임산 초기 주의사항",
                      "제1강. 임산 초기 주의사항"]
        titles1 = ["제1강. 어서와 C언어는 처음이지!",
                   "제2강. 어서와 C언어는 처음이지!",
                   "제1강. AWS 시스템 설계와 마이그레이션 ",
                   "제2강. AWS 시스템 설계와 마이그레이션 ",
                   "제3강. AWS 시스템 설계와 마이그레이션 ",]
        titles2 = ["제1강. 부동산을 팔고 금을 사라",
                   "제1강. 펀드, 모른다면 이것만 해라!",
                   "제2강. 펀드, 모른다면 이것만 해라!",
                   "제3강. 펀드, 모른다면 이것만 해라!",
                   "제2강. 부동산을 팔고 금을 사라"]
        titles3 = ["제1강. 백종원의 요리비책",
                   "제2강. 백종원의 요리비책",
                   "제3강. 백종원의 요리비책",
                   "제1강. 회사에서하는 유산소운동 다이어트",
                   "제2강. 회사에서하는 유산소운동 다이어트"]
        titles4 = ["제1강. 중국어 3달만에 귀가 트이는 법",
                   "제1강. 스페인여행 기초회화",
                   "제1강. 너도 영어할래?",
                   "제2강. 너도 영어할래?",
                   "제3강. 너도 영어할래?"]
        titles5 = ["제1강. 어린이 안전교육",
                   "제2강. 어린이 안전교육",
                   "제3강. 어린이 안전교육",
                   "제1강. 임산 초기 주의사항",
                   "제2강. 임산 초기 주의사항"]
        titles6 = ["제1강. 문과도 쉽게 학습하는 ADsP",
                   "제2강. 문과도 쉽게 학습하는 ADsP",
                   "제3강. 문과도 쉽게 학습하는 ADsP",
                   "제1강. AWS클라우드 이해하기",
                   "제2강. AWS클라우드 이해하기"]
        
        //["전체", "1개발", "2금융", "3문화", "4외국어", "5육아", "6자격증"]
        imgurls_duty = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Fire/image/Chap1.png")!,
                        URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Fire/image/Chap2.png")!,
                        URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Disabled/image/Chap1.png")!,
                        URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Disabled/image/Chap2.png")!,
                        URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Duty/Disabled/image/Chap3.png")!]
        imgurls_famous = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Health/image/Chap1.png")!,
                          URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap1.png")!,
                          URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Fund/image/Chap1.png")!,
                          URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap1.png")!,
                          URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!]
        imgurls_new = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/image/Chap1.png")!,
                       URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/Chinese/image/Chap1.png")!,
                       URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/Spanish/image/Chap1.png")!,
                       URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Edu/image/Chap1.png")!,
                       URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Edu/image/Chap2.png")!]
        imgurls1 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/C/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/C/image/Chap3.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!]
        imgurls2 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Estate/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Fund/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Fund/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Fund/image/Chap3.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Finance/Estate/image/Chap2.png")!]
        imgurls3 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/image/Chap3.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Health/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Health/image/Chap2.png")!]
        imgurls4 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/Chinese/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/Spanish/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/English/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/English/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Language/English/image/Chap3.png")!]
        imgurls5 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Edu/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Edu/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Preg/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Preg/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Prenatal/image/Chap1.png")!]
        imgurls6 = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap3.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap1.png")!,
                    URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap2.png")!]
        
        titles = [titles_duty, titles_famous, titles_new, titles1, titles2, titles3, titles4, titles5, titles6]
        imgurls = [imgurls_duty, imgurls_famous, imgurls_new, imgurls1, imgurls2, imgurls3, imgurls4, imgurls5, imgurls6]
        videoTimes = [[4110, 2510, 11511, 9032, 1300],
                      [5513, 3520, 1511, 9032, 1300],
                      [1113, 15320, 1511, 9032, 1300],
                      [2113, 1530, 1411, 90132, 1300],
                      [3211, 5525, 15511, 9032, 1300],
                      [4110, 2510, 11511, 9032, 1300],
                      [5513, 3520, 1511, 9032, 1300],
                      [4110, 2510, 11511, 9032, 1300],
                      [5513, 3520, 1511, 9032, 1300]]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var row = indexPath.row
        var collectionRow = collectionView.tag-2
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3CollectionViewCell", for: indexPath) as! Home3CollectionViewCell
        
        
        print(collectionRow)
        cell.lblTitle.text = titles[collectionRow][row]

        cell.imgVideo.downloadImage(from: imgurls[collectionRow][row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true

        cell.lblVideoTime.text = timeIntToString(from: videoTimes[collectionRow][row])

        
        return cell
    }
    
    func timeIntToString(from time: Int) -> String {
        
        let totalSeconds = time
        let hours = Int(totalSeconds / 3600 )
        let minutes = Int(totalSeconds % 3600) / 60
        let seconds = Int(totalSeconds % 3600) % 60
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }

}
