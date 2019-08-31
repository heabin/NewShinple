//
//  MoreTabTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class MoreTabTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //cell
    let cellIdentifier1 = "MoreTabImgIdentifier"
    let cellIdentifier2 = "MoreTabListIdentifier"
    let arr = ["알림함","문의하기","로그아웃"]
    let segueIdentifier = ["goToAlert2","goToQuestion","logOutIdentifier"]
    
    var flag: Bool = false

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(!flag){
            let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier1, for: indexPath)
            cell.textLabel?.text = "img test"
            flag = true
            return cell
        }else{
            let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier2, for: indexPath)
            cell.textLabel?.text = arr[indexPath.row]
            return cell
        }
        
    }
    
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
        
        if(segueIdentifier[indexPath.row] == "logOutIdentifier"){
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
            
        }else{
            self.performSegue(withIdentifier: segueIdentifier[indexPath.row], sender: self)
        }
        
    }

  
}
