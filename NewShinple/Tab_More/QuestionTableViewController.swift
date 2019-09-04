//
//  QuestionTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//


import UIKit

class QuestionTableViewController: UITableViewController {

    var flag = [Bool](repeating: false, count: 4)
    let colorLightGray = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell

        
        if row == 0 {
            cell.lblTitle.text = "받은쪽지"
            cell.lblContent.text = "안녕하세요. 문의사항 답변드립니다."
            cell.lblDate.text = "19.09.09  09:05"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
        } else if row == 1 {
            cell.lblTitle.text = "받은쪽지"
            cell.lblContent.text = "안녕하세요. 문의사항 답변드립니다."
            cell.lblDate.text = "19.09.08  15:03"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
        } else {
            cell.lblTitle.text = "보낸쪽지"
            cell.lblContent.text = "동영상 재생이 되지 않아요. 개발을 이런식으로"
            cell.lblDate.text = "19.09.01   13:01"
            if(flag[indexPath.row]){
                cell.backgroundColor = colorLightGray
                cell.lblTitle.textColor = .darkGray
            }
        }
        
        return cell
    }
    
    //table cell 클릭시 이동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let segueIdentifier = "QuestionDetail"
        
        if(!flag[indexPath.row]) {
            flag[indexPath.row] = true
        }
        tableView.reloadData()
        
        
        
        
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
