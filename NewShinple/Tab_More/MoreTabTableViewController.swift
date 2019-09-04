//
//  MoreTabTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import MobileCoreServices

class MoreTabTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //cell
    let cellIdentifier1 = "MoreTabTableViewCell1"
    let cellIdentifier2 = "MoreTabTableViewCell2"
    
    //사진 업로드 변수
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var image: UIImage!
    var flagImageSave = false

    
    
    let arr = ["알림함","문의하기","로그아웃"]
    let segueIdentifier = ["goToAlert2","goToQuestion","logOutIdentifier"]

//    @IBOutlet weak var profileImg: UIImageView!
    
    
  
    /* ------------ 사진 이미지 업로드 코드  ------------*/
    //클릭시 이미지 변경
    @IBAction func addAction(_ sender: UIButton) {
        
        let alert =  UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @objc func openLibrary(){
        flagImageSave = true
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        present(imagePicker, animated: false, completion: nil)
    }
    
    @objc func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            flagImageSave = true
            //            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            
            imagePicker.allowsEditing = false
            present(imagePicker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    
    /*------------ 이미지 선택 완료 후 실행 코드 ------------*/
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
                print("imagePickerController : UIImageWriteToSavedPhotosAlbum")
            }
            self.tableView.reloadData()
            print("imagePickerController : tableView.reloadData()")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
  
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arr.count+1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let rowLine = indexPath.row
        let listLine = indexPath.row-1
        if(rowLine == 0){
            let cell  = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier1, for: indexPath) as! MoreTabTableViewCell1
            
            cell.company.text = "신한DS"
            cell.deptAndPosition.text = "그룹솔루션" + "  " + "선임"
            //cell.position.text = "선임"
            cell.name.text = "김신한"
            
            cell.profileImg.contentMode = .scaleAspectFill
            cell.profileImg.layer.cornerRadius = cell.profileImg.frame.width / 2
            cell.profileImg.layer.masksToBounds = true
            if(!flagImageSave){
                cell.profileImg.image = UIImage(named: "5.png")
            }else{
                cell.profileImg.image = image!
            }

            tableView.rowHeight = 310
            
            return cell
        }else{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier2, for: indexPath)as! MoreTabTableViewCell2
            
            cell.textLabel?.text = arr[listLine]
            
            cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
            cell.textLabel?.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 30).isActive = true
            cell.textLabel?.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 30)
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else {
            return 50
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
        
        // 프로필 이미지 라인
        let rowLine = indexPath.row
        
        // 더보기 리스트 라인
        let listLine = indexPath.row - 1
        
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

