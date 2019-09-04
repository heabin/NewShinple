//
//  Home3CollectionView.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class Home3CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // for 메인 페이지
    var titles = [[String]]()
    var imgurls = [[URL]]()
    var videoRates = [[CGFloat]]()
    var videoTimes = [[Int]]()
    
    // for 더보기 페이지
    var contents = [[String]]()
    var favorites = [[Bool]]()

    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        
        let getDataFromHome = HomeTableViewController()
        let etc = getDataFromHome.setSampleRecentData()
        
        print(etc)
        
        for i in 0..<6 {
            print(i)
            
            var temp_titles = [String]()
            var temp_imgUrls = [URL]()
            var temp_videoRates = [CGFloat]()
            var temp_videoTimes = [Int]()
            
            var temp_contents = [String]()
            var temp_favorites = [Bool]()
            
            for j in 0..<10 {
                print(j)
                
                temp_titles.append(etc[j]._L_name!)
                temp_imgUrls.append(URL(string: etc[j]._L_link_img!)!)
                temp_videoRates.append(CGFloat(Int(etc[j]._U_length!) / Int(etc[j]._L_length!)))
                temp_videoTimes.append(Int(etc[j]._L_length!))
                
                temp_contents.append("Today let's talk about salaries and how much money you can make as an iOS / Android Engineer out in the Bay Area / Silicon Valley.")
                temp_favorites.append(etc[j]._J_status as! Bool)

            }
            
            titles.append(temp_titles)
            imgurls.append(temp_imgUrls)
            videoRates.append(temp_videoRates)
            videoTimes.append(temp_videoTimes)
            
            contents.append(temp_contents)
            favorites.append(temp_favorites)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var row = indexPath.row
        var collectionRow = collectionView.tag-2
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3CollectionViewCell", for: indexPath) as! Home3CollectionViewCell
        
        cell.lblTitle.text = titles[collectionRow][row]
        
        cell.imgVideo.downloadImage(from: imgurls[collectionRow][row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        cell.lblVideoTime.text = timeIntToString(from: videoTimes[collectionRow][row])

        
        return cell
    }

}
