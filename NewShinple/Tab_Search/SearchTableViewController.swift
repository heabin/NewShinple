//
//  SearchTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

/*
 bin
 */
class SearchTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let colorLightGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    
    let colorStartBlue = UIColor(red: 37/255, green: 97/255, blue: 166/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 45/255, green: 132/255, blue: 194/255, alpha: 1)
    let colorEndBlue = UIColor(red: 53/255, green: 169/255, blue: 223/255, alpha: 1)
    
    var isSearchBarFocused = false
    var lectureArray = [String]()
    var currentLectureArray = [String]()
    var searchedBefore = [String?]()
    struct cgFloatInt {
        var width: Int
        var height: Int
        var widthSpacing: Int
        var heightSpacing: Int
        var buttonSizing: Int
        init(w: Int, h:Int, ws:Int, hs:Int, bs:Int) {
            width = w
            height = h
            widthSpacing = ws
            heightSpacing = hs
            buttonSizing = bs
        }
    }
    
    var searchArray: [String] = ["IC","ss","A","집에 가고싶다","개발개발", "강의 듣기"]
    var custom: cgFloatInt = cgFloatInt(w: 25, h: 30, ws: 200, hs:35, bs:100)
 

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return searchArray.count+1
    }
    
    //목록 삭제 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row >= 2){
        print("ddd")
            if(editingStyle == .delete){
                searchArray.remove(at: (indexPath as NSIndexPath).row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }else if(editingStyle == .insert){
                
            }
        }
        
    }
    
    // 선택 셀 삭제 불가 함수
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        var edit: Bool = true;
        
        if(indexPath.row == 0) {
            
            edit = false;
        }
        
        return edit;
    }
    
    

    //삭제시 Delete 대신 "삭제"
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var rowline = indexPath.row
//        SearchTableViewCell1
        if(rowline == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell1", for: indexPath) as! SearchTableViewCell1
            
            cell.label.text = "최근 검색기록 입니다."
//            cell.allDeleteBtn?.textInputContextIdentifier = "X"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell2", for: indexPath) as! SearchTableViewCell2
            cell.searchContent.text = searchArray[indexPath.row-1]
            
            
            return cell
        }
       
    }
    


    //-------------viewDidLoad-------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
    }
    
    
    // called when text starts editing
    @available(iOS 2.0, *)
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchBarFocused = true
        self.searchBar.showsCancelButton = true
        if searchedBefore.isEmpty {
//            self.view.bringSubviewToFront(lblNoPreviousSample)
        } else {
//            self.view.bringSubviewToFront(searchedScrollView)
        }
        print("searchBarTextDidBeginEditing")
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            if searchedBefore.isEmpty {
//                self.view.bringSubviewToFront(lblNoPreviousSample)
            } else {
//                self.view.bringSubviewToFront(searchedScrollView)
            }
            tableView.isHidden = true
            currentLectureArray = lectureArray
            tableView.reloadData()
            return
        }
        tableView.isHidden = false
        self.view.bringSubviewToFront(tableView)
        currentLectureArray = lectureArray.filter({ lecture -> Bool in
            lecture.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // called when cancel button pressed
    @available(iOS 2.0, *)
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearchBarFocused = false
        tableView.reloadData()
//        self.view.bringSubviewToFront(btnSearchHashtag)
//        self.view.bringSubviewToFront(btnSearchCategory)
        if searchedBefore.isEmpty {
//            self.view.bringSubviewToFront(lblNoPreviousSample)
        } else {
//            self.view.bringSubviewToFront(searchedScrollView)
        }
        searchBar.endEditing(true)
        self.searchBar.text = ""
        self.searchBar.showsCancelButton = false
    }
    
    
}
