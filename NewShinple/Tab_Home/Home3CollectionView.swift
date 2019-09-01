//
//  Home3CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class Home3CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    var titles = [["제1강. Swift 부시기", "제2강. 메인페이지힘듦..", "제3강. 던져버리고싶다", "제4강. 에헤라디야", "제5강. 뿌셔뿌셔"],
                  ["몽쉘 생크림케이크", "행복한 카스타드", "HAITAI 오예스", "명가 찰떡 파이", "맛있는거 먹고싶다"],
                  ["A TWOSOME PLACE", "Level UP! 막심커피", "스타벅스", "개인적으로 할리스짱", "배고프다"],
                  ["보라돌이","뚜비","나나","뽀","텔레토비"],
                  ["제1강. Swift 부시기", "제2강. 메인페이지힘듦..", "제3강. 던져버리고싶다", "제4강. 에헤라디야", "제5강. 뿌셔뿌셔"],
                  ["몽쉘 생크림케이크", "행복한 카스타드", "HAITAI 오예스", "명가 찰떡 파이", "맛있는거 먹고싶다"]]
    
    var imagieFiles = [
                       ["video6.png", "video7.png", "video8.png", "video9.png", "video10.png"],
                       ["video5.png", "video4.png", "video3.png", "video2.png", "video.png"],
                       ["video10.png", "video9.png", "video8.png", "video7.png", "video6.png"],
                       ["video3.png", "video.png", "video5.png", "video4.png", "video3.png"],
                       ["video2.png", "video6.png", "video7.png", "video4.png", "video5.png"],
                       ["video8.png", "video2.png", "video10.png", "video3.png", "video.png"]]
    
    var testurl = URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Poutine.png")

    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3CollectionViewCell", for: indexPath) as! Home3CollectionViewCell
        
        cell.lblTitle.text = titles[collectionView.tag-2][indexPath.row]
        cell.imgVideo.image = UIImage(named: imagieFiles[collectionView.tag-2][indexPath.row])
        
        //image url 사용
        //let testdata = try! Data(contentsOf: testurl!)
        //cell.imgVideo.image = UIImage(data: testdata)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        HomeTableViewController().goToDetailPage()
    }

}
