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
        
        anivationView.animationSpeed = 6
        
        // 4. Play animation
        anivationView.play { (finished) in
            if finished {
//                UserDefaults.standard.hasOnboarded = false
                UserDefaults.standard.hasSubscription = false
                if(UserDefaults.standard.hasOnboarded){
                    if(UserDefaults.standard.hasSubscription) {
                        self.loadMeasurePage()
                    } else{
                        self.loadLTO()
                    }
    
                } else {
                    let controller1 = self.storyboard?.instantiateViewController(identifier: "onboard") as! OnboardingViewController
                                    controller1.modalPresentationStyle = .fullScreen
                                    controller1.modalTransitionStyle = .coverVertical
                    self.present(controller1, animated: true)
                }
            }
        }
        
    }
    
    private func loadLTO(){
        let controller = self.storyboard?.instantiateViewController(identifier: "LTO") as! LTOViewController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true)
    }
    
    private func loadMeasurePage(){
        let controller = self.storyboard?.instantiateViewController(identifier: "measure") as! MeasureViewController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true)
    }
}
