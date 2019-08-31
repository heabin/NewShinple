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

    // videoView 의 위치를 잡아주기 위한 것들
    @IBOutlet weak var LargeView: UIView!
    @IBOutlet weak var SmallView: UIView!
    @IBOutlet weak var videoView: UIView!
    
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
    var isBookmarked: Bool = false
    var isFullScreen: Bool = false
    let urlString = "https://shinplestorage.s3.us-east-2.amazonaws.com/lectureTest.mp4"
    //let urlString = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"
    var player: AVPlayer?
    
    // 로딩화면
    let activityIndicatorView: UIActivityIndicatorView = {
        print("로딩중-----")
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
    }()
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
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
    }
    
    
    // 동영상 불러오기
    private func setupPlayerView(){
        if let url = NSURL(string: urlString){
            player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.name = "videoPlayerLayer"
            videoView.layer.addSublayer(playerLayer)
            playerLayer.frame = videoView.layer.bounds
            //CGRect(x: 0, y: 0, width: videoView.frame.width, height: videoView.frame.height)
            
            player?.play()
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
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
            
            print("강의불러와라")
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
        btnPlayPause.setImage(UIImage(named: "icons8-pause-100"), for: .normal)
        btnPlayPause.tintColor = .white
        btnForward.translatesAutoresizingMaskIntoConstraints = false
        btnForward.setImage(UIImage(named: "icons8-forward-10-100"), for: .normal)
        btnForward.tintColor = .white
        btnFullScreen.translatesAutoresizingMaskIntoConstraints = false
        btnFullScreen.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
        btnFullScreen.tintColor = .white
        
        print("설정끝*")
    }
    
    // 슬라이더(재생)
    let sssssss: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.white
        slider.thumbTintColor = UIColor.red
        slider.value = 1
        
        return slider
    }()
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("가로모드")
            videoView.translatesAutoresizingMaskIntoConstraints = false
            videoView.leadingAnchor.constraint(equalTo: LargeView.leadingAnchor).isActive = true
            videoView.trailingAnchor.constraint(equalTo: LargeView.trailingAnchor).isActive = true
            videoView.topAnchor.constraint(equalTo: LargeView.topAnchor).isActive = true

        } else {
            print("세로모드")
            videoView.translatesAutoresizingMaskIntoConstraints = false
            videoView.leadingAnchor.constraint(equalTo: SmallView.leadingAnchor).isActive = true
            videoView.trailingAnchor.constraint(equalTo: SmallView.trailingAnchor).isActive = true
            videoView.topAnchor.constraint(equalTo: SmallView.topAnchor).isActive = true
        }
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
            btnFullScreen.setImage(UIImage(named: "icons8-normal-screen-90"), for: .normal)
        } else {
            btnFullScreen.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
        }
        
        
    }
    
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        player?.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
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
}
