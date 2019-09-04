//
//  VideoDetailViewController.swift
//  NewShinple
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit
import AVFoundation

class VideoDetailViewController: UIViewController {
    
    // 강의 url
    let urlString = "https://shinpleios.s3.us-east-2.amazonaws.com/Culture/Cook/video/Chap1.mp4"
    
    
    // videoView 의 위치를 잡아주기 위한 것들
    @IBOutlet weak var LargeView: UIView!
    @IBOutlet weak var SmallView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // 미디어컨트롤
    @IBOutlet weak var btnGoBack: UIButton!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var btnRewind: UIButton!
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblVideoLength: UILabel!
    @IBOutlet weak var btnFullScreen: UIButton!
    @IBOutlet weak var videoSlider: UISlider!
    
    
    // 미디어 제어 관련 변수
    var isPlaying:Bool = false
    var isControlOn: Bool = true
    var isBookmarked: Bool = false
    var isFullScreen: Bool = false
    let layer = CALayer()
    
    var player: AVPlayer?
    var playerLayer = AVPlayerLayer()
    
    // 로딩화면
    let activityIndicatorView: UIActivityIndicatorView = {
        print("로딩중-----")
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
    }()
    
    // 평가관련
    @IBOutlet weak var EvaluationView: UIView!
    @IBOutlet weak var btnBad: UIButton!
    @IBOutlet weak var btnNormal: UIButton!
    @IBOutlet weak var btnGood: UIButton!
    
    @IBOutlet weak var TabContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 그냥 작은 화면일때 기준이 되는 뷰를 한개 더 만들었음
        //SmallView.isHidden = true
        
        // 시작시 위치 잡아주기
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.leadingAnchor.constraint(equalTo: SmallView.leadingAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: SmallView.topAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: SmallView.trailingAnchor).isActive = true
        videoView.bottomAnchor.constraint(equalTo: SmallView.bottomAnchor).isActive = true
        
        // 비디오 불러오기
        setupPlayerView()
        // 라이브러리 설정
        settingLibrary()
        controlOnOff()
        
        // 뷰를 터치했을때
        let gesture = UITapGestureRecognizer(target: self, action: Selector(("someAction:")))
        self.videoView.addGestureRecognizer(gesture)
        
        
        SmallView.backgroundColor = .black
        LargeView.backgroundColor = .black
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("화면꺼질때")
        let duration = player?.currentItem?.duration
        let totalSeconds = CMTimeGetSeconds(duration!)
        print("전체시간 : \(totalSeconds)")
        
        let current = videoSlider.value
        print("현재시간 : \(current)")
        
        let temp: Float = Float(current) / Float(totalSeconds) * 100
        let percent: Int = Int(temp)
        print("진행률 : \(percent)")
    }
    
    // 동영상 불러오기
    private func setupPlayerView(){
        if let url = NSURL(string: urlString){
            player = AVPlayer(url: url as URL)
            
            playerLayer = AVPlayerLayer(player: player)
            playerLayer.name = "videoPlayerLayer"
            videoView.layer.addSublayer(playerLayer)
            playerLayer.frame = videoView.layer.bounds
            
            //CGRect(x: 0, y: 0, width: videoView.frame.width, height: videoView.frame.height)
            
            player?.pause()
            isPlaying = false
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
          
            // 현재재생시간
            let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))

            let mainQueue = DispatchQueue.main
            _ = player?.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: {[weak self]
                time in
                guard let currentItem = self?.player?.currentItem else {return}
                self?.videoSlider.maximumValue = Float(currentItem.duration.seconds)
                self?.videoSlider.minimumValue = 0
                self?.videoSlider.value = Float(currentItem.currentTime().seconds)
                self?.lblCurrentTime.text = self?.getTimeString(from: currentItem.currentTime())
            })
            
        }
    }
    
    // 레이아웃 설정
    func settingLibrary(){
        
        print("*라이브러리 설정시작 >> ", separator: "", terminator: " ")
        
        // 로딩표시
        videoView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: videoView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: videoView.centerYAnchor).isActive = true
        
        // 이미지, 색 설정
        btnGoBack.translatesAutoresizingMaskIntoConstraints = false
        btnGoBack.setImage(UIImage(named: "icons8-expand-arrow-90"), for: .normal)
        btnGoBack.tintColor = .white
        btnBookmark.translatesAutoresizingMaskIntoConstraints = false
        btnBookmark.setImage(UIImage(named: "heart_empty"), for: .normal)
        btnBookmark.tintColor = .white
        btnRewind.translatesAutoresizingMaskIntoConstraints = false
        btnRewind.setImage(UIImage(named: "icons8-replay-10-100"), for: .normal)
        btnRewind.tintColor = .white
        btnPlayPause.translatesAutoresizingMaskIntoConstraints = false
        btnPlayPause.setImage(UIImage(named: "icons8-play-100"), for: .normal)
        btnPlayPause.tintColor = .white
        btnForward.translatesAutoresizingMaskIntoConstraints = false
        btnForward.setImage(UIImage(named: "icons8-forward-10-100"), for: .normal)
        btnForward.tintColor = .white
        btnFullScreen.translatesAutoresizingMaskIntoConstraints = false
        btnFullScreen.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
        btnFullScreen.tintColor = .white
        
//        videoSlider.translatesAutoresizingMaskIntoConstraints = false
//        videoSlider.setThumbImage(UIImage(named: "thumb_circle"), for: .normal)
        
        
        btnBad.setImage(UIImage(named: "bad_empty"), for: .normal)
        btnBad.tintColor = .white
        btnNormal.setImage(UIImage(named: "normal_empty"), for: .normal)
        btnNormal.tintColor = .white
        btnGood.setImage(UIImage(named: "good_empty"), for: .normal)
        btnGood.tintColor = .white

        EvaluationView.isHidden = true
        print("설정끝*")
    }
    
    
    // MARK: - 함수
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            // 동영상 로딩완료
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
            videoView.backgroundColor = .clear
            
            isControlOn = false
            controlOnOff()
            
            if let duration = player?.currentItem?.duration {
                let secondsText = getTimeString(from: duration)
                lblVideoLength.text = secondsText
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("가로모드")
            videoView.translatesAutoresizingMaskIntoConstraints = false
            videoView.leadingAnchor.constraint(equalTo: LargeView.leadingAnchor).isActive = true
            videoView.trailingAnchor.constraint(equalTo: LargeView.trailingAnchor).isActive = true
            videoView.topAnchor.constraint(equalTo: LargeView.topAnchor).isActive = true
            btnFullScreen.setImage(UIImage(named: "icons8-normal-screen-90"), for: .normal)
            
            TabContainerView.isHidden = true
            self.view.backgroundColor = .black
        } else {
            print("세로모드")
            videoView.translatesAutoresizingMaskIntoConstraints = false
            videoView.leadingAnchor.constraint(equalTo: SmallView.leadingAnchor).isActive = true
            videoView.trailingAnchor.constraint(equalTo: SmallView.trailingAnchor).isActive = true
            videoView.topAnchor.constraint(equalTo: SmallView.topAnchor).isActive = true
            
            btnFullScreen.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
            TabContainerView.isHidden = false
            
            self.view.backgroundColor = .white
        }
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        // do other task
        print("화면 터치")
        controlOnOff()
    }
    
    func controlOnOff(){
        if isControlOn {
            print("컨트롤 끄기")
            btnGoBack.isHidden = true
            btnBookmark.isHidden = true
            btnRewind.isHidden = true
            btnPlayPause.isHidden = true
            btnForward.isHidden = true
            lblCurrentTime.isHidden = true
            lblVideoLength.isHidden = true
            btnFullScreen.isHidden = true
            videoSlider.isHidden = true
            
            if let sublayers = videoView.layer.sublayers {
                for layer in sublayers {
                    if layer.name == "gradientLayer" {
                        layer.removeFromSuperlayer()
                        break
                    }
                }
            }
            
        }else {
            print("컨트롤 켜기")
            
            layer.frame = videoView.layer.bounds
            layer.backgroundColor = UIColor.black.cgColor
            layer.opacity = 0.5
            layer.name = "gradientLayer"
            videoView.layer.addSublayer(layer)
            
            btnGoBack.isHidden = false
            btnBookmark.isHidden = false
            btnRewind.isHidden = false
            btnPlayPause.isHidden = false
            btnForward.isHidden = false
            lblCurrentTime.isHidden = false
            lblVideoLength.isHidden = false
            btnFullScreen.isHidden = false
            videoSlider.isHidden = false
            
            // 제일위로
            btnGoBack.layer.zPosition = 1
            btnBookmark.layer.zPosition = 1
            btnRewind.layer.zPosition = 1
            btnPlayPause.layer.zPosition = 1
            btnForward.layer.zPosition = 1
            lblCurrentTime.layer.zPosition = 1
            lblVideoLength.layer.zPosition = 1
            btnFullScreen.layer.zPosition = 1
            videoSlider.layer.zPosition = 1
        }
        isControlOn = !isControlOn
    }
    
    // MARK: - 액션
    @IBAction func GoPrevPage(_ sender: UIButton) {
        print("이전페이지로")
        self.dismiss(animated: true)
    }
    
    @IBAction func Bookmark(_ sender: UIButton) {
        if isBookmarked {
            print("북마크 삭제")
            btnBookmark.setImage(UIImage(named: "heart_empty"), for: .normal)
        }else {
            print("북마크 추가")
            btnBookmark.setImage(UIImage(named: "heart_fill"), for: .normal)
        }
        isBookmarked = !isBookmarked
    }
    
    @IBAction func Rewind10sec(_ sender: UIButton) {
        print("뒤로 10초")
        var newTime = videoSlider.value - 10.0
        if newTime < 0 {
            newTime = 0
        }
        player?.seek(to: CMTimeMake(value: Int64(newTime), timescale: 1))
        videoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @IBAction func PlayPause(_ sender: UIButton) {
        print("처음 재생 누름 \(isPlaying)")
        if isPlaying {
            player?.pause()
            btnPlayPause.setImage(UIImage(named: "icons8-play-100"), for: .normal)
        } else {
            player?.play()
            btnPlayPause.setImage(UIImage(named: "icons8-pause-100"), for: .normal)
        }
        isPlaying = !isPlaying
    }
    
    @IBAction func Forward10sec(_ sender: UIButton) {
        print("앞으로 10초")
        var newTime = videoSlider.value + 10.0
        
        if newTime > videoSlider.maximumValue {
            newTime = videoSlider.maximumValue
        }
        player?.seek(to: CMTimeMake(value: Int64(newTime), timescale: 1))
    }
    
    @IBAction func FullScreen(_ sender: UIButton) {
        //        videoView.translatesAutoresizingMaskIntoConstraints = false
        //        videoView.frame = SmallView.bounds
        //        var t = CGAffineTransform.identity
        //        t = t.translatedBy(x: 100, y: 0)    // 세로형으로 보는 그대로 x,y
        //        t = t.translatedBy(x: 0, y: 0)
        //        t = t.rotated(by: .pi / 2)
        //        t = t.scaledBy(x: 1.5, y: 1.5)
        //
        //        videoView.transform = t
        //
        //        videoView.translatesAutoresizingMaskIntoConstraints = false
        //        videoView.leadingAnchor.constraint(equalTo: LargeView.leadingAnchor).isActive = true
        //        videoView.trailingAnchor.constraint(equalTo: LargeView.trailingAnchor).isActive = true
        //        videoView.topAnchor.constraint(equalTo: LargeView.topAnchor, constant: 10).isActive = true
        if isFullScreen {
            print("화면 최소 버튼 누르기")
            btnFullScreen.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
        } else {
            print("전체화면 버튼 누르기")
            btnFullScreen.setImage(UIImage(named: "icons8-normal-screen-90"), for: .normal)
        }
        isFullScreen = !isFullScreen
    }
    
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        player?.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
    }
    
    
    // 영상 종료 완료 수강 완료
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("강의끝********")
        EvaluationView.isHidden = false
        EvaluationView.layer.zPosition = 1
        
    }
    
    @IBAction func BadEvaluation(_ sender: UIButton) {
        print("강의 별로에요")
        btnBad.setImage(UIImage(named: "bad_fill"), for: .normal)
        btnBad.tintColor = .white
        
        btnNormal.isEnabled = false
        btnGood.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.closeEvaluation()
        })
    }
    
    @IBAction func NormalEvaluation(_ sender: UIButton) {
        print("강의 보통이에요")
        btnNormal.setImage(UIImage(named: "normal_fill"), for: .normal)
        btnNormal.tintColor = .white
        
        btnBad.isEnabled = false
        btnGood.isEnabled = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.closeEvaluation()
        })
    }
    
    @IBAction func GoodEvaluation(_ sender: UIButton) {
        print("강의 최고에요")
        btnGood.setImage(UIImage(named: "good_fill"), for: .normal)
        btnGood.tintColor = .white
        
        btnBad.isEnabled = false
        btnNormal.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.closeEvaluation()
        })
    }
    
    func closeEvaluation(){
        EvaluationView.isHidden = true
    }
    
    
    // MARK: - 기타함수
    // 시간 포멧
    func getTimeString(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds / 3600 )
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }
    
    // 레이어의 사이즈를 비디오뷰에 맞춘다
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layer.frame = videoView.bounds
        playerLayer.frame = videoView.bounds
//        gradientLayer.frame = videoView.bounds
    }
}
