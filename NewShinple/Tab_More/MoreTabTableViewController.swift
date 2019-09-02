//
//  MoreTabTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class MoreTabTableViewController: UITableViewController {

    //cell
    let cellIdentifier1 = "MoreTabTableViewCell1"
    let cellIdentifier2 = "MoreTabTableViewCell2"
    
    
    let arr = ["알림함","문의하기","로그아웃"]
    let segueIdentifier = ["goToAlert2","goToQuestion","logOutIdentifier"]

//    @IBOutlet weak var profileImg: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        
        
        
        
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return arr.count+1

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var rowLine = indexPath.row
        var listLine = indexPath.row-1
        if(rowLine == 0){
            let cell  = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier1, for: indexPath) as! MoreTabTableViewCell1
            
            
            //셀 클릭시 이동 막기
//            cell.isSelected = false
            
            cell.company.text = "신한DS"
            cell.dept.text = "그룹솔루션"
            cell.position.text = "선임"
            cell.name.text = "김신한"
            
            cell.profileImg.layer.cornerRadius = cell.profileImg.frame.width / 2
            cell.profileImg.layer.masksToBounds = true
            cell.profileImg.image = UIImage(named: "1.jpeg")

            tableView.rowHeight = 310
            
            return cell
        }else{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier2, for: indexPath)as! MoreTabTableViewCell2
            cell.textLabel?.text = arr[listLine]
            tableView.rowHeight = 70
            return cell
        }
        
    }
    
    //table cell 높이 조정
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        var rowLine = indexPath.row
//        if(rowLine == 0){
//            return 200
//        }else{
//            return 100
//        }
//    }
    
    //table cell 클릭시 이동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        /*로그아웃 설정 부분*/
        let alert = UIAlertController(title: "",message: "로그아웃 하시겠습니까?",preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler:{
            ACTION in UserDefaults.standard.removeObject(forKey: "id")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginSID")
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = vc
            appDelegate.window?.makeKeyAndVisible()
        })

        let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
        
        // 프로필 이미지 라인
        var rowLine = indexPath.row
        
        // 더보기 리스트 라인
        var listLine = indexPath.row - 1
        
        if(rowLine == 0){
            
        }else{
            if(segueIdentifier[listLine] == "logOutIdentifier"){
                alert.addAction(yesAction)
                alert.addAction(noAction)
                present(alert, animated: true, completion: nil)
            }else{
                 self.performSegue(withIdentifier: segueIdentifier[listLine], sender: self)
            }
        }
        
    }

  
}
