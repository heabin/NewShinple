//
//  QuestionDetailViewController.swift
//  NewShinple
//
//  Created by user on 31/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtViewContent: UITextView!
    @IBOutlet weak var lblLine1: UILabel!
    @IBOutlet weak var lblLine2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblLine1.layer.borderWidth = 1
        lblLine1.layer.borderColor = UIColor.lightGray.cgColor
        lblLine2.layer.borderWidth = 1
        lblLine2.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
