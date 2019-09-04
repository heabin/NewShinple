//
//  ViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

// MARK:- EC_login
extension UIColor {
    static var lightBlue = UIColor(red: 0/255, green: 192/255, blue: 243/255, alpha:1)
}

//로그인 밑줄
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}


class LoginViewController: UIViewController {

    //MARK: - Login IBOutlet
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var imgID: UIImageView!
    @IBOutlet weak var imgPW: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    
    //image login
    let img_log = UIImage(named: "logo_first")
    let img_id = UIImage(named: "user2")
    let img_pw = UIImage(named: "password2")
    
    var SaveOn = false
    
    // MARK : DAEUN 로그인 정보, 추후 DB에서 가지고 와야함
    let id = "shinple"
    let pw = "123"
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 로고 애니메이션
        var loading_01: UIImage!
        var loading_02: UIImage!
        var loading_03: UIImage!
        var loading_04: UIImage!
        var loading_05: UIImage!
        var loading_06: UIImage!
        var loading_07: UIImage!
        var loading_08: UIImage!
        var loading_09: UIImage!
        var loading_10: UIImage!
        var loading_11: UIImage!
        var loading_12: UIImage!
        var loading_14: UIImage!
        var loading_13: UIImage!

        var shinpleAni_0: UIImage!
        var shinpleAni_1: UIImage!
        var shinpleAni_2: UIImage!
        var shinpleAni_3: UIImage!
        var shinpleAni_4: UIImage!
        var shinpleAni_5: UIImage!
        
        var images: [UIImage]!
        var animatedImage: UIImage!
        
        loading_01 = UIImage(named: "logo_3_1")
        loading_02 = UIImage(named: "logo_3_2")
        loading_03 = UIImage(named: "logo_3_3")
        loading_04 = UIImage(named: "logo_3_4")
        loading_05 = UIImage(named: "logo_3_5")
        loading_06 = UIImage(named: "logo_3_6")
        loading_07 = UIImage(named: "logo_3_7")
        loading_08 = UIImage(named: "logo_3_8")
        loading_09 = UIImage(named: "logo_3_9")
        loading_10 = UIImage(named: "logo_3_10")
        loading_11 = UIImage(named: "logo_3_11")
        loading_12 = UIImage(named: "logo_3_12")
        loading_14 = UIImage(named: "logo_3_14")
        loading_13 = UIImage(named: "logo_3_13")
        
        shinpleAni_0 = UIImage(named: "logo_3_15")
        shinpleAni_1 = UIImage(named: "logo_2_14")
        shinpleAni_2 = UIImage(named: "logo_2_15")
        shinpleAni_3 = UIImage(named: "logo_2_16")
        shinpleAni_4 = UIImage(named: "logo_2_17")
        shinpleAni_5 = UIImage(named: "logo_2_18")
        
        
        images = [loading_01,loading_02, loading_03, loading_04, loading_05, loading_06, loading_07, loading_08, loading_09, loading_10, loading_11, loading_12, loading_14,loading_13,
                  loading_13,loading_13,

            
            
        shinpleAni_0, shinpleAni_1,shinpleAni_2,shinpleAni_3, shinpleAni_4, shinpleAni_5]
        
        animatedImage = UIImage.animatedImage(with: images, duration: 2.0)
        imgLogo.image = animatedImage
        
        
//        imgLogo.image = img_log
        imgID.image = img_id
        // 코드 상에는 아울렛 걸렸지만, 스토리보드의 이름 imgPW로 변경 안 되어 에러 발생. 이미지 옮기는 것에는 문제 없음.
        imgPW.image = img_pw

        //btnLogin.backgroundColor = .lightBlue
        btnLogin.setTitleColor(.white, for: .normal)
        //btnLogin.layer.cornerRadius = 8

        txtID.borderStyle = .none
        txtPW.borderStyle = .none
        txtID.layer.addBorder([.bottom], color: .lightGray, width: 1.0)
        txtPW.layer.addBorder([.bottom], color: .lightGray, width: 1.0)


        txtID.returnKeyType = .done
        txtPW.returnKeyType = .done
        keyBoardHandling(txtID)
        keyBoardHandling(txtPW)
    }
    
    //MARK: - KEY BORAD login
    //-----------------키보드 올릴 때
    func keyBoardHandling(_ sender:UITextField){
        // 키보드가 보일때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification){
        NSLog("—keyboardWillShow—")
        self.view.frame.origin.y = -50
    }
    
    @objc func keyboardWillHide(_ sender: Notification){
        NSLog("—keyboardWillHide")
        self.view.frame.origin.y = 0
    }
    
    
    //-----------------키보드 내릴 때
    // done 선택 시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("==== textFieldShouldReturn ====")
        
        textField.resignFirstResponder()
        return true
    }
    
    // 아무데나 선택 시
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Action
    //login
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //텍스트박스의 로그의 로그인(아이디, 비밀번호) 규칙을 해야한다.
        
        //        //텍스트박스 박스에 공백이 아니면,
        //        if !(txtID.text!.isEmpty || txtPW.text!.isEmpty) {
        //            if SaveOn {
        //                print("로그인 정보 저장하기")
        //                //로그인 정보 저장하기
        //                UserDefaults.standard.set(txtID.text, forKey: "id")
        //                UserDefaults.standard.set(txtPW.text, forKey: "pw")
        //            }
        ////            print("로그인하기")
        ////            print("=====" + UserDefaults.standard.string(forKey: "id")!)
        ////            print("=====" + UserDefaults.standard.string(forKey: "pw")!)
        //        }
        
        // MARK : - DAEUN 로그인
        // 아이디와 비밀번호가 일치하면 아이디를 userDefaults.standart에 저장
        if txtID.text! == id && pw == txtPW.text! {
            UserDefaults.standard.set(txtID.text, forKey: "id")
            
            let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = myTabBar
            
            //            let vc = storyboard?.instantiateViewController(withIdentifier: "myTabBar")
            //            navigationController?.pushViewController(vc!, animated: true)
        }else{
            let alert = UIAlertController(title: "경고", message: "아이디 혹은 비밀번호가 맞지 않습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
}

/**
 A convenient UIImageView to load and cache images.
 */
open class CachedImageView: UIImageView {
    
    public static let imageCache = NSCache<NSString, UIImage>()
    
    func setImageCache(item: UIImage, urlKey: String) {
        CachedImageView.imageCache.setObject(item, forKey: urlKey as NSString)
    }
    
    func loadCacheImage(urlKey: String, completion: (() -> ())? = nil) -> UIImage {
        let cachedItem = CachedImageView.imageCache.object(forKey: urlKey as NSString)
        return cachedItem!
    }
}

