//
//  TabBarController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        
    }
    
    @objc func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("###")
        print(viewController.tabBarItem.tag)
        print("###")
    }
    
    
//
//    var homeTableViewController: HomeTableViewController!
//    var searchTableViewController: SearchTableViewController!
//    var myListViewController: MyListViewController!
//    var moreTabTableViewController: MoreTabTableViewController!
//
//
//
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        self.delegate = self
//        homeTableViewController = HomeTableViewController()
//        searchTableViewController = SearchTableViewController()
//        myListViewController = MyListViewController()
//        moreTabTableViewController = MoreTabTableViewController()
//
//         viewControllers = [homeTableViewController, searchTableViewController, myListViewController, moreTabTableViewController]
//
//        for tabBarItem in tabBar.items! {
//            tabBarItem.title = ""
//            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
//
//    }
//
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController.isKind(of: HomeTableViewController.self) {
//            let vc =  HomeTableViewController()
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//            return false
//        }
//        return true
//    }
//
//
//
//
//
//    func tabBarController3(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController.isKind(of: MyListViewController.self) {
//            let vc =  MyListViewController()
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//            return false
//        }
//        return true
//    }
//

    
}
