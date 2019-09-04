//
//  FirstLoadingViewController.swift
//  NewShinple
//
//  Created by user on 04/09/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class FirstLoadingViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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


    }
    


}
