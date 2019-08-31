//
//  HomeTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, selectCategoryDelegate{
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    var sorting = 0
    var selected = ""

    var userName = "권민재"
    var categories = ["마이페이지", "최근시청강의", "필수 강의", "인기 강의", "신규 강의" ,"[대분류1] ICT개발", "[대분류2] 인프라", "[대분류3] 정보보안"]
    
    
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var number: Int = 80
    
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video6.png", "video7.png", "video8.png", "video9.png", "video10.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    

    
    //TableView cell
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if sorting == 0 {
            if row == 0 {
                return 40
            } else if row == 1 {
                return 190
            }else {
                return 160
            }
        } else {
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
        if sorting == 0 {
            return categories.count
        } else {
            return imagieFiles.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if sorting == 0 {
            print("sorting=0")
            
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.lblFirst.text = "대분류"
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategory), for: .touchUpInside)
                
                return cell
            }else if row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell2") as! HomeTableViewCell2
                
                cell.lblName.text = userName
                cell.lblCategory.text = "님의 최근시청 강의입니다."
                
                cell.btnMore.addTarget(self, action: #selector(goToVideoList), for: .touchUpInside)
                
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell3") as! HomeTableViewCell3
                
                cell.lblCategory.text = categories[indexPath.row]
                cell.collectionView.tag = indexPath.row
                
                cell.btnMore.addTarget(self, action: #selector(goToVideoList), for: .touchUpInside)
                
                return cell
            }
            
        } else {
            print("sorting=1")
            
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategory), for: .touchUpInside)
                cell.lblFirst.text = selected
                
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
        }
        
    }
    
    @objc func setFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "heart_fill.png") {
            sender.setImage(heartEmpty, for: .normal)
        } else if sender.currentImage == UIImage(named: "heart_empty.png") {
            sender.setImage(heartFill, for: .normal)
        }
    }
    
    @objc func goToVideoList() {
        performSegue(withIdentifier: "goToMore", sender: nil)
    }
    
    @objc func goToFirstCategory() {
        performSegue(withIdentifier: "goToFirstCategory", sender: nil)
    }
    
    @objc func goToSecondCategory() {
        performSegue(withIdentifier: "goToSecondCategory", sender: nil)
    }
    
    func goToDetailPage() {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoDetailSID")
            UIApplication.topViewController()!.present(viewController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("select")
        
        if segue.identifier == "goToFirstCategory" || segue.identifier == "goToSecondCategory" {
            let categoryController = segue.destination as! CategoryTableViewController
            
            if segue.identifier == "goToFirstCategory" {
                categoryController.category = ["전체", "개발","금융","문학","어학","육아","자격증","필수강의", "추가"]
            } else if segue.identifier == "goToSecondCategory" {
                if sorting == 0 {
                    categoryController.category = ["----------"]
                } else {
                    categoryController.category = ["전체", "두번째", "카테고리", "입니다."]
                }
            }
            categoryController.delegate = self
        }
        
        
    }
    
    func selectFirstCategory(_ controller: CategoryTableViewController, message: String) {
        
        print("돌아옴")
        
        selected = message
        if selected == "전체" {
            sorting = 0
        } else {
            sorting = 1
        }

        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }

    
}


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
