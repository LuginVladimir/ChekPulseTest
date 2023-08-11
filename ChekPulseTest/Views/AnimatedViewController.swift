//
//  AnimatedViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 11.08.23.
//

import UIKit
import Lottie

class AnimatedViewController: UIViewController {
    
    @IBOutlet weak var anivationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Set animation content mode
        
        anivationView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        
        anivationView.loopMode = .playOnce
        
        // 3. Adjust animation speed
        
        anivationView.animationSpeed = 2
        
        // 4. Play animation
        anivationView.play { (finished) in
            if finished {
                let controller = self.storyboard?.instantiateViewController(identifier: "main") as! OnboardingViewController
                                controller.modalPresentationStyle = .fullScreen
                                controller.modalTransitionStyle = .coverVertical
                self.present(controller, animated: true)
            

//                let controller = storyboard?.instantiateViewController(identifier: "main") as! OnboardingViewController
//                controller.modalPresentationStyle = .fullScreen
//                controller.modalTransitionStyle = .coverVertical
//                present(controller, animated: true)
            }
        }
    }
}
