//
//  HomeTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController, selectCategoryDelegate ,UITabBarControllerDelegate{

    
    @IBOutlet weak var alertBtn: UIBarButtonItem!
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    let image : UIImage? = UIImage.init(named: "alert_push.png")!.withRenderingMode(.alwaysOriginal)
    
    
    // MARK: - Table view data source
    //---------- Data Source ----------//
    
    // main data(default), MainTitle은 3번째부터
    var userName = "권민재"
    var MainTitle = ["마이페이지", "최근시청강의", "필수 강의", "인기 강의", "신규 강의" ,"[대분류1] ICT개발", "[대분류2] 인프라", "[대분류3] 정보보안"]
    
    
    @IBOutlet var ItemCollectionView: UITableView!
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
    
    
    // Video Data in Main Title Cell
    func setSampleRecentData() -> [My_Lec_List] {
        var sample = [My_Lec_List]()
        var index = 0
        
        for _ in 0..<15 {
            var lectureSample = My_Lec_List()
            
            lectureSample._My_num = index as NSNumber
            index += 1
            
            lectureSample._Lecture_num = 11003
            lectureSample._S_cate_num = 10000
            
            lectureSample._Duty = 1
            lectureSample._C_status = 0
            lectureSample._J_status = 0
            
            lectureSample._L_name = "세상에 나쁜 개는 없다"
            lectureSample._L_length = 1000
            lectureSample._L_link_img =  "https://shinpleios.s3.us-east-2.amazonaws.com/Infant/Edu/image/Chap1.png"
            lectureSample._L_link_video = "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/video/Chap1.mp4"
            lectureSample._E_date = "2019-09-19"
            
            lectureSample._U_length = 200
            lectureSample._W_date = "2019-09-30"
            
            sample.append(lectureSample)
        }
        
        
        return sample
    }
    
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    
    
    // for 더보기 페이지
    var titles:[String] = []
    var imgurls:[URL] = []
    var videoRates:[Float] = []
    var contents:[String] = []
    var videoTimes:[Int] = []
    var favorites:[Bool] = []
    
    //---------- Important Variable ----------//
    
    // 대분류, 소분류 솔팅 케이스 (0,1,2)
    var sortingCase = 0
    
    // categort controller에서 선택된 카테고리명 가져오기
    var sortingFirstCategoryName = ""
    var sortingSecondCategoryName = ""

    // 카테고리 더보기의 MainTitle text
    var selectedMainTitle = ""

    
    //----------------??????????????????????????????????????????
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //        print("###")
        //        print(viewController.tabBarItem.tag)
        //        print("###")
    }
    
    
    //MARK: - viowDidLoad
    //---------- DidLoad() ----------//
    var VideoData = [My_Lec_List]()
    
    // 전체화면으로 생성해야함
    let LoadingView: UIView = {
        let view = UIView()
        
        //UIScreen.main.bounds.size.width
        view.frame = UIScreen.main.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    // 이미지뷰
   let loadingImageView: UIImageView = {
        // 사이즈 고정!
        let imgLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 232));
        imgLogo.backgroundColor = .white
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


        images = [
            loading_01,loading_02, loading_03, loading_04, loading_05,
            loading_06, loading_07, loading_08, loading_09, loading_10,
            loading_11, loading_12, loading_14,loading_13,loading_13,loading_13,
            shinpleAni_0, shinpleAni_1,shinpleAni_2,shinpleAni_3, shinpleAni_4, shinpleAni_5]

        animatedImage = UIImage.animatedImage(with: images, duration: 3.0)
        imgLogo.image = animatedImage
    
        return imgLogo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("메인화면띄움")
        
        view.addSubview(LoadingView)
        LoadingView.translatesAutoresizingMaskIntoConstraints = false
        LoadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LoadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        LoadingView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        LoadingView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        view.addSubview(loadingImageView)
        loadingImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingImageView.centerXAnchor.constraint(equalTo: LoadingView.centerXAnchor).isActive = true
        loadingImageView.centerYAnchor.constraint(equalTo: LoadingView.centerYAnchor, constant: -116).isActive = true
        
        // MARK: - DAEUN 로딩화면 구현 영상 로드가 끝난 시점에서 dismissSplashController 호출
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
        
        
        
        VideoData = setSampleRecentData()
        
        self.tabBarController?.delegate = self
        alertBtn.image = image
        
        print("MoreData")
        
        for i in 0..<10 {
            titles.append(VideoData[i]._L_name!)
            imgurls.append(URL(string: VideoData[i]._L_link_img!)!)
            videoRates.append(Float(Int(VideoData[i]._U_length!) / Int(VideoData[i]._L_length!)))
            
            contents.append("Today let's talk about salaries and how much money you can make as an iOS / Android Engineer out in the Bay Area / Silicon Valley.")
            videoTimes.append(Int(VideoData[i]._L_length!))
            favorites.append(VideoData[i]._J_status! as! Bool)
        }
        
    }
    
    @objc func dismissSplashController(){
        // 로딩창 끄기
        LoadingView.isHidden = true
        loadingImageView.isHidden = true
    }
    
    
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
            return titles.count
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
                
                
                cell.lblTitle.text = titles[row]
                cell.lblContent.text = contents[row]
                
                
                cell.imgVideo.downloadImage(from: imgurls[indexPath.row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if indexPath.row % 2 == 0 {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
                }else {
                    cell.btnFavorite.setImage(heartEmpty, for: .normal)
                }
                
                cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
                
                cell.sliderTime.setValue(videoRates[row], animated: false)
                
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
                
                
                cell.lblTitle.text = titles[row]
                cell.lblContent.text = contents[row]
                
                
                cell.imgVideo.downloadImage(from: imgurls[indexPath.row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if indexPath.row % 2 == 0 {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
                }else {
                    cell.btnFavorite.setImage(heartEmpty, for: .normal)
                }
                
                cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
                
                cell.sliderTime.setValue(videoRates[row], animated: false)
                
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
            
            //moreController.delegate = self
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

class My_Lec_List: NSObject {
    
    var _My_num : NSNumber?
    var _E_num : NSNumber?
    var _C_status : NSNumber?
    var _J_status : NSNumber?
    var _L_length : NSNumber?
    var _L_link_img : String?
    var _L_link_video : String?
    var _L_name : String?
    var _Lecture_num : NSNumber?
    var _S_cate_num : NSNumber?
    var _U_length : NSNumber?
    var _W_date : String?
    var _E_date : String?
    var _Duty : NSNumber?
    
}

extension UIImageView {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
                
            }
        }
    }
    
    func timeIntToString(from time: Int) -> String {
        
        let totalSeconds = time
        let hours = Int(totalSeconds / 3600 )
        let minutes = Int(totalSeconds % 3600) / 60
        let seconds = Int(totalSeconds % 3600) % 60
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }
    
}

extension UICollectionView {
    
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        HomeTableViewController().goToDetailPage()
    }
    
    func timeIntToString(from time: Int) -> String {
        
        let totalSeconds = time
        let hours = Int(totalSeconds / 3600 )
        let minutes = Int(totalSeconds % 3600) / 60
        let seconds = Int(totalSeconds % 3600) % 60
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }
    
}


