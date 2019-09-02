//
//  CategoryTableViewController.swift
//  NewShinple
//
//  Created by user on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit


protocol selectCategoryDelegate {
    func selectFirstCategory(_ controller: CategoryTableViewController, message: String)
}


class CategoryTableViewController: UITableViewController {
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    let selectedCategory = ""
    var category = [""]
    var delegate : selectCategoryDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = colorLightGray

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return category.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.btnCategory.tintColor = .darkGray
        cell.btnCategory.setTitle(category[indexPath.row], for: .normal)
        cell.btnCategory.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)

        
        return cell
    }
    
    @objc func goToMainPage(_ sender: UIButton) {
        sender.setTitleColor(colorEndBlue, for: .normal)
        if delegate != nil {
            delegate?.selectFirstCategory(self, message: sender.currentTitle!)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    

}

