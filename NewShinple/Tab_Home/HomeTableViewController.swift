//
//  HomeTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController, selectCategoryDelegate, selectMoreCategoryDelegate {
    
    
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    
    
    
    //---------- DidLoad() ----------//
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    // MARK: - Table view data source
    //---------- Data Source ----------//
    
    // main data(default), MainTitle은 3번째부터
    var userName = "권민재"
    var MainTitle = ["마이페이지", "최근시청강의", "필수 강의", "인기 강의", "신규 강의" ,"[대분류1] ICT개발", "[대분류2] 인프라", "[대분류3] 정보보안"]
    
    
    // First: 대분류, Second: 소분류
    var Firstcategories = ["전체", "개발","금융","문학","어학","육아","자격증","필수강의"]
    var SecondCategorieEmpty = ["----------"]
    var SecondCategories = [["전체","ICT","인프라","정보보안"],
                          ["전체","금융1","금융2","금융3"],
                          ["전체","문학1","문학2","문학3"],
                          ["전체","어학1","어학2","어학3"],
                          ["전체","육아1","육아2","육아3"],
                          ["전체","자격증1","자격증2","자격증3"],
                          ["전체","필수강의1","필수강의2","필수강의3"]]
    
    
    // videoList data
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var number: Int = 80
    
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video6.png", "video7.png", "video8.png", "video9.png", "video10.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    
    
    
    
    //---------- Important Variable ----------//
    
    // 대분류, 소분류 솔팅 케이스 (0,1,2)
    var sortingCase = 0
    
    // categort controller에서 선택된 카테고리명 가져오기
    var sortingFirstCategoryName = ""
    var sortingSecondCategoryName = ""

    // 카테고리 더보기의 MainTitle text
    var selectedMainTitle = ""

    
    
    
    
    //Mark: - TableViewCell
    //---------- TableView 셋팅 ----------//
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if sortingCase == 0 {       // default - 대분류: 전체, 소분류: 전체
            if row == 0 {
                return 40
            } else if row == 1 {
                return 190
            }else {
                return 160
            }
        } else {                    // 대분류 or 소분류 솔팅, VideoList
            if row == 0 {
                return 40
            }else {
                return 120
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sortingCase == 0 {
            return MainTitle.count
        } else {
            return imagieFiles.count
        }
    }
    
    
    
    
    
    //----------Soritng case 적용----------//
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        //----------대분류: 전체, 소분류: 전체 - Sorting case: 0
        if sortingCase == 0 {
            print("sorting=0")
            
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.lblFirst.text = "대분류"
                cell.lblSecond.text = "소분류"
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategory), for: .touchUpInside)
                
                return cell
            }else if row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell2") as! HomeTableViewCell2
                
                cell.lblName.text = userName
                cell.lblCategory.text = "님의 최근시청 강의입니다."
                
                cell.btnMore.tag = row
                cell.btnMore.addTarget(self, action: #selector(goToVideoList(_:)), for: .touchUpInside)
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell3") as! HomeTableViewCell3
                
                cell.lblCategory.text = MainTitle[indexPath.row]
                cell.collectionView.tag = indexPath.row
                
                cell.btnMore.tag = row
                cell.btnMore.addTarget(self, action: #selector(goToVideoList(_:)), for: .touchUpInside)
                
                return cell
            }
        
            
        //----------대분류: 선택, 소분류: 전체 - Sorting case: 1
        } else if sortingCase == 1{
            print("sorting=1")
            
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategory), for: .touchUpInside)
                cell.lblFirst.text = sortingFirstCategoryName
                cell.lblSecond.text = "소분류"
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell4") as! HomeTableViewCell4
                
                
                cell.lblTitle.text = titles
                cell.lblWatchingTime.text = "진행률: " + String(number) + " %"
                cell.lblContent.text = contents
                
                
                cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if indexPath.row % 2 == 0 {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
                }else {
                    cell.btnFavorite.setImage(heartEmpty, for: .normal)
                }
                
                cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
                
                return cell
            }
            
            
        //----------대분류: 선택, 소분류: 선택 - Sorting case: 2
        } else if sortingCase == 2 {
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategory), for: .touchUpInside)
                //cell.lblFirst.text = sortingFirstCategoryName
                cell.lblSecond.text = sortingSecondCategoryName
                
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell4") as! HomeTableViewCell4
                
                
                cell.lblTitle.text = titles
                cell.lblWatchingTime.text = "진행률: " + String(number) + " %"
                cell.lblContent.text = contents
                
                
                cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if indexPath.row % 2 == 0 {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
                }else {
                    cell.btnFavorite.setImage(heartEmpty, for: .normal)
                }
                
                cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
                
                return cell
            }
        
            
        //----------Error
        } else {
            print("Not in Case")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
            cell.lblFirst.text = "Error"
            
            return cell
        }
        
    }
    
    
    
    
    //---------- 좋아요 클릭/해제 ----------//
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }
    
    
    
    
    //---------- Segue를 통한 페이지 이동 ----------//
    
    //더보기 페이지
    @objc func goToVideoList(_ sender: UIButton) {
        
        selectedMainTitle = MainTitle[sender.tag]
        
        performSegue(withIdentifier: "goToMore", sender: nil)
    }
    
    //대분류 선택 페이지
    @objc func goToFirstCategory() {
        performSegue(withIdentifier: "goToFirstCategory", sender: nil)
    }
    
    //소분류 선택 페이지
    @objc func goToSecondCategory() {
        performSegue(withIdentifier: "goToSecondCategory", sender: nil)
    }
    
    
    
    
    //---------- SID를 통한 페이지 이동 ----------//
    
    // 강의 상세보기(재생) 페이지
    func goToDetailPage() {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID")
            UIApplication.topViewController()!.present(viewController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    //---------- Segue를 이용한 페이지 이동에 데이터 전송 ----------//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("select")
        
        //---------- 대분류, 소분류 카테고리 데이터
        if segue.identifier == "goToFirstCategory" || segue.identifier == "goToSecondCategory" {
            
            let categoryController = segue.destination as! CategoryTableViewController
            
            // 대분류 데이터
            if segue.identifier == "goToFirstCategory" {
                categoryController.buttonNum = 0
                categoryController.category = Firstcategories
                

            // 소분류 데이터
            } else if segue.identifier == "goToSecondCategory" {
                
                // 대분류가 전체일 때, 소분류 Empty
                if sortingCase == 0 {
                    categoryController.category = SecondCategorieEmpty
                    
                
                // 대분류가 선택되었을 때, 그에 해당하는 소분류 데이터 넘기기
                } else {
                    categoryController.buttonNum = 1
                    
                    
                    // 대분류에 맞는 소분류 찾기
                    var i:Int = 0

                    while sortingFirstCategoryName != Firstcategories[i] {
                        i += 1
                    }
                    
                    categoryController.category = SecondCategories[i-1]
                    
                }
            }
            
            categoryController.delegate = self
        
            
            
        //---------- MainTitle의 더보기 데이터
        }else if segue.identifier == "goToMore" {
            
            let moreController = segue.destination as! HomeMoreTableViewController
            
            // 선택한 MainTitle name 넘기기
            moreController.mainTitleName = selectedMainTitle
            
            moreController.delegate = self
        }
    }
    
    
    
    
    
    //---------- 대분류, 소분류 선택 후 돌아온 메인화면 ----------//
    
    func selectFirstCategory(_ controller: CategoryTableViewController, message: String) {
        
        print("대분류 선택 후 Back")
        
        sortingFirstCategoryName = message
        
        if sortingFirstCategoryName == "전체" {
            sortingCase = 0
        } else {
            sortingCase = 1
        }

        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }

    
    func selectSecondCatogory(_ controller: CategoryTableViewController, message: String) {
        print("소분류 선택 후 Back")
        
        sortingSecondCategoryName = message
        
        if sortingSecondCategoryName == "전체" {
            sortingCase = 1
        } else {
            sortingCase = 2
        }
        
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    func selectedCategoryName(_ controller: HomeMoreTableViewController, message: String) {
        
        print("MoreList")
        
    }
    
}



//---------- SID 불러올 때 필요 ----------//
extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
