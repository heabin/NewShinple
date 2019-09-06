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
class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    let sampleData = ["어서와 C언어는 처음이지!", "AWS 시스템 설계와 마이그레이션", "나도 이제 데이터 분석 준전문가", "초보자를 위한 파이썬", "Python과 Pygame으로 게임 만들기", "당신이 지금 알아야 할 AWS", "The 친절한 Swift 프로그래밍", "10대와 통하는 스포츠 이야기", "토익의 입문", "부동산을 팔고 금을 사라", "펀드, 모른다면 이것만 해라!", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]

    
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //---------- 샘플 Data ----------//
    
    var baseArray: [String] = ["IC","ss","A","집에 가고싶다","개발개발", "강의 듣기"]
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video6.png", "video7.png", "video8.png", "video9.png", "video10.png"]
    var videoRate: [Float] = [0,0.4,0,0,0.8,0,0,0,0,0]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    
    //---------- important variable ----------//
    
    var searchedData = [String]()
    var searching = false
    var selectedButton = false
    var selectedTitle = ""


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = indexPath.row
        
        if (selectedButton == false) {
            if row == 0{
                return 40
            }else {
                return 50
            }
        } else {
            return 120
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (selectedButton == false) {
            if searching{
                return searchedData.count+1
            }else {
                return baseArray.count+1
            }
        } else {
            return imagieFiles.count
        }
        
    }
    
    //목록 삭제 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == .delete){
            baseArray.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
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
        
        let row = indexPath.row
        let listLine = row-1
        
//        SearchTableViewCell
        if(selectedButton == false) {
            if(row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell1", for: indexPath) as! SearchTableViewCell1
                
                if searching {
                    cell.isHidden = true
                }else {
                    cell.label.text = "최근 검색기록 입니다.   "
                    cell.backgroundColor = colorLightGray
                    cell.label.backgroundColor = colorLightGray
                    
                    cell.allDeleteBtn.addTarget(self, action: #selector(delectCell), for: .touchUpInside)
                    //            cell.allDeleteBtn?.textInputContextIdentifier = "X"
                }
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell2", for: indexPath) as! SearchTableViewCell2
                if searching {
                    cell.btnSearchContent.setTitle(searchedData[listLine], for: .normal)
                    cell.btnSearchContent.addTarget(self, action: #selector(goToDetailList(_:)), for: .touchUpInside)
                } else {
                    print("sample data print")
                    cell.btnSearchContent.setTitle(baseArray[listLine], for: .normal)
                    cell.btnSearchContent.addTarget(self, action: #selector(goToDetailList(_:)), for: .touchUpInside)
                }
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell1") as! SearchDetailTableViewCell1
            
            cell.lblTitle.text = titles
            cell.lblContent.text = contents
            
            cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
//            cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
            
            if indexPath.row % 2 == 0 {
                cell.btnFavorite.setImage(heartFill, for: .normal)
            }else {
                cell.btnFavorite.setImage(heartEmpty, for: .normal)
            }
            
            cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
            
            cell.sliderTime.setValue(videoRate[row], animated: false)
            
            return cell
        }
       
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailPage()
    }
    
    
    @objc func goToDetailList(_ sender: UIButton) {
        
        selectedButton = true
        selectedTitle = sender.currentTitle!
        searchBar.text = selectedTitle

        self.searchBar.endEditing(true)
        
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    //---------- 좋아요 클릭/해제 ----------//
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }
    
    func goToDetailPage() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID")
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    //전체 삭제 함수
    @objc func delectCell() {
        baseArray = []
        tableView.reloadData()
    }
    
    //-------------viewDidLoad-------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchedData = sampleData.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if selectedButton == false {
            searching = false
            searchBar.text = ""
        } else if selectedButton == true {
            searching = false
            selectedButton = false
            
            self.tableView.reloadData()
            refreshControl?.endRefreshing()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("edit start")
        
        searching = true
        selectedButton = false
        
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("edit end")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.tableView.endEditing(true)
        self.view.endEditing(true)
    }
    
    
}
