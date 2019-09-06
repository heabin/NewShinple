//
//  HomeTableViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AWSDynamoDB




class HomeTableViewController: UITableViewController, selectCategoryDelegate ,UITabBarControllerDelegate{
    
    
    
    
    
    @IBOutlet var alertView: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    @IBOutlet weak var alertBtn: UIBarButtonItem!
    
    //---------- 공통 color ----------//
    
    let colorStartBlue = UIColor(red: 15/255, green: 83/255, blue: 163/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 20/255, green: 123/255, blue: 195/255, alpha: 1)
    let colorEndBlue = UIColor(red: 27/255, green: 164/255, blue: 227/255, alpha: 1)
    let colorLightGray = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    
    
    
    
    
    
    
    
    // MARK: - Table view data source
    //---------- Data Source ----------//
    
    // main data(default), MainTitle은 3번째부터
    var userName = "권민재"
    var MainTitle = ["마이페이지", "최근시청강의", "필수 강의", "인기 강의", "신규 강의", "개발", "금융", "문화", "외국어", "육아", "자격증"]
    
    
    @IBOutlet var ItemCollectionView: UITableView!
    
    // First: 대분류, Second: 소분류
    
    
    var Firstcategories = ["전체", "개발", "금융", "문화", "외국어", "육아", "자격증", "필수강의"]

    var SecondCategorieEmpty = ["----------"]
    var SecondCategories = [["전체","C언어","CSS","HTML", "JAVA", "Python"],
                          ["전체","부동산","펀드","주식"],
                          ["전체","문화","요리","건강", "스포츠"],
                          ["전체","중국어","영어","독일어", "일본어", "스페인어"],
                          ["전체","유아교육","임신과출산","태교"],
                          ["전체","ADSP","AWS","IELTS","SQLD","TOEIC"],
                          ["전체","장애인식개선","소방안전","개인정보보호","성폭력예방"]]
    

    // 그림
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFill = UIImage(named: "heart_fill.png")
    let alert_none = UIImage.init(named: "alert.png")!.withRenderingMode(.alwaysOriginal)
    let alert_push = UIImage.init(named: "alert_push.png")!.withRenderingMode(.alwaysOriginal)
    
    
    // 분류 선택시 타이틀
    var titles:[String] = ["", "제1강. 어서와 C언어는 처음이지!",
                            "제2강. 어서와 C언어는 처음이지!",
                            "제1강. AWS 시스템 설계와 마이그레이션",
                            "제2강. AWS 시스템 설계와 마이그레이션",
                            "제3강. AWS 시스템 설계와 마이그레이션",
                            "제1강. 나도 이제 데이터 분석 준전문가",
                            "제2강. 나도 이제 데이터 분석 준전문가"]
    var imgurls:[URL] = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/C/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/C/image/Chap3.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/AWS/image/Chap3.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!]
    var videoRates:[Float] = [0, 1, 0.7, 0.2, 0, 0.3, 0, 0]
    var contents:[String] = ["", "C 언어를 처음 시작하는 출발선은 같지만 C 언어 문법 하나하나가",
                            "초보자들을 위한 쉽게 설명하는 C프로그래밍 가이드",
                            "가장 강력한 클라우드 서비스를 경험하기 위한 최고의 AWS 가이드클라우드나",
                            "클라우드나 AWS를 직접 배우고 싶다면, 실질적으로 구성해보는 예제가 궁금하다면",
                            "AWS와 서비스 운영에 첫걸음을 내디딜 수 있게 도와준다!",
                            "『데이터 분석 전문가 가이드(ADP)(ADSP)』는 데이터 분석 전문가 양성을 위한",
                            "한국데이터베이스진흥원에서 실시하고 있는 데이터 분석 전문가 자격증"]
    var videoTimes:[Int] = [0, 2000, 5200, 2500, 6030, 6700, 5300, 1800, 4300]
    var favorites:[Bool] = [true, true, true, false, false, true, true, true]
    
    
    //개발 소분류 선택시
    var titles2:[String] = ["", "제1강. 초보자를 위한 파이썬",
                           "제2강. 초보자를 위한 파이썬",
                           "제1강. Python과 Pygame으로 게임 만들기 ",
                           "제2강. Python과 Pygame으로 게임 만들기 ",
                           "제3강. Python과 Pygame으로 게임 만들기 ",
                           "제1강. 나도 이제 데이터 분석 준전문가",
                           "제2강. 나도 이제 데이터 분석 준전문가"]
    var imgurls2:[URL] = [URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp4.png")!,
                          URL(string: "https:/shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp5.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chapp3.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chap1.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Develop/Python/image/Chap2.png")!,
                         URL(string: "https://shinpleios.s3.us-east-2.amazonaws.com/Certi/ADSP/image/Chap2.png")!]
    var videoRates2:[Float] = [0, 1, 1, 0.7, 0.5, 0.1, 1, 0.2]
    var contents2:[String] = ["", "『데이터 분석 전문가 가이드(ADP)(ADSP)』는 데이터 분석 전문가 양성을 위한",
                              "한국데이터베이스진흥원에서 실시하고 있는 데이터 분석 전문가 자격증",
                              "머신 러닝과 딥 러닝에 관한 텐서플로 예제를 구현해 보면서",
                              "기본적인 머신 러닝 알고리즘(선형회귀, KNN, K-MEANS)",
                              "Pygame 라이브러리에 대한 소개와 함께 2D 그래픽 게임",
                              "다양한 그래픽 효과와 알고리즘에 대해 알아보는 동영상",
                              "Pygame 프레임워크(Pygame 라이브러리)와 Python 프로그래밍 언어"]
    var videoTimes2:[Int] = [0, 2000, 5200, 2500, 6030, 6700, 5300, 1800, 4300]
    var favorites2:[Bool] = [true, true, true, true, false, false, false, false]
    
    

    
    //---------- Important Variable ----------//
    
    // 대분류, 소분류 솔팅 케이스 (0,1,2)
    var sortingCase = 0
    
    // categort controller에서 선택된 카테고리명 가져오기
    var sortingFirstCategoryName = ""
    var sortingSecondCategoryName = ""

    // 카테고리 더보기의 MainTitle text
    var selectedMainTitle = ""
    
    // 알림 push 유무
    var alertboolean = false
    
    
    
    
    

    
    //----------------??????????????????????????????????????????
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
    
    
    
    
    //---------- 로딩 페이지 ----------//
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

        animatedImage = UIImage.animatedImage(with: images, duration: 2.0)
        imgLogo.image = animatedImage
    
        return imgLogo
    }()
    
    
    func loadingView() {
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
    }
    
    
    // 데이터 다 받으면 로딩페이지 끝내기
    func isCachingCompleted() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.LoadingView.isHidden = true
            self.loadingImageView.isHidden = true
            
            //Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
        }
    }
    
    
    // 알람 푸쉬
    func pushAlert() {
        if (alertboolean) {
            alertBtn.image = alert_push
        } else {
            alertBtn.image = alert_none
        }
        
    }

    
    
    
    //MARK: - viowDidLoad
    //---------- DidLoad() ----------//
    var VideoData = [My_Lec_List]()
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        
        // 알림 푸쉬
        self.tabBarController?.delegate = self
        pushAlert()
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
            return 11
        } else {
            return 8
        }
    }


    
    
    //----------Soritng case 적용----------//
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var row = indexPath.row
        
        //----------대분류: 전체, 소분류: 전체 - Sorting case: 0
        if sortingCase == 0 {
            print("sorting=0")
            
            if row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
                
                cell.lblFirst.text = "대분류"
                cell.lblSecond.text = "소분류"
                cell.btnFirst.addTarget(self, action: #selector(goToFirstCategory), for: .touchUpInside)
                cell.btnSecond.addTarget(self, action: #selector(goToSecondCategoryEmpty), for: .touchUpInside)

                return cell
                
            }else if row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell2") as! HomeTableViewCell2
                
                cell.lblName.text = userName
                cell.lblCategory.text = "님의 최근시청 강의입니다."

                cell.btnMore.tag = indexPath.row
                cell.btnMore.addTarget(self, action: #selector(goToVideoList(_:)), for: .touchUpInside)

                return cell
            }else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell3") as! HomeTableViewCell3
                    

                cell.lblCategory.text = self.MainTitle[indexPath.row]
                cell.collectionView.tag = indexPath.row
                
                cell.btnMore.tag = indexPath.row
                cell.btnMore.addTarget(self, action: #selector(self.goToVideoList(_:)), for: .touchUpInside)
            
                return cell
            }
                
            
        //----------대분류: 선택, 소분류: 전체 - Sorting case: 1
        } else if sortingCase == 1{
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
                cell.imgVideo.downloadImage(from: imgurls[row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if favorites[row] == true {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
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
                cell.lblSecond.text = sortingSecondCategoryName
                
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell4") as! HomeTableViewCell4
                
                
                cell.lblTitle.text = titles2[row]
                cell.lblContent.text = contents2[row]
                cell.imgVideo.downloadImage(from: imgurls2[row])
                cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
                
                if favorites2[row] == true {
                    cell.btnFavorite.setImage(heartFill, for: .normal)
                }
                cell.btnFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
                cell.sliderTime.setValue(videoRates2[row], animated: false)
                
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
        print("goToFirst")
        performSegue(withIdentifier: "goToFirstCategory", sender: nil)
        print("endToFirs")
    }
    
    //소분류 선택 페이지
    @objc func goToSecondCategory() {
        performSegue(withIdentifier: "goToSecondCategory", sender: nil)
    }
    

    @objc func goToSecondCategoryEmpty() {
        pushAlert(message: "대분류를 선택해주세요.")
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(offAlert), userInfo: nil, repeats: false)
        
    }
    
    func pushAlert(message: String) {
        
        lblMessage.translatesAutoresizingMaskIntoConstraints = false
        lblMessage.text = message
        lblMessage.layer.masksToBounds = true
        lblMessage.layer.cornerRadius = 10
        
        alertView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        alertView.alpha = 1
        
        self.view.addSubview(alertView)
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    @objc func offAlert() {
        self.alertView.removeFromSuperview()
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


