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
//        flush()
        
        // 1. Set animation content mode
        
        anivationView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        
        anivationView.loopMode = .playOnce
        
        // 3. Adjust animation speed
        
        anivationView.animationSpeed = 4
        
        // 4. Play animation
        anivationView.play { (finished) in
            if finished {
                if(UserDefaults.standard.hasOnboarded){
                    if(UserDefaults.standard.hasSubscription) {
                        self.loadMeasurePage()
                    } else{
                        self.loadLTO()
                    }
    
                } else {
                    let controller1 = self.storyboard?.instantiateViewController(identifier: "main") as! OnboardingViewController
                                    controller1.modalPresentationStyle = .fullScreen
                                    controller1.modalTransitionStyle = .coverVertical
                    self.present(controller1, animated: true)
                }
            }
        }
        
    }
    
    private func flush(){
        UserDefaults.standard.hasOnboarded = false
        UserDefaults.standard.hasSubscription = false
        UserDefaults.standard.removeObject(forKey:UserDefaults.UserDafaultsDeys.scoreChartData.rawValue)
        UserDefaults.standard.removeObject(forKey:UserDefaults.UserDafaultsDeys.scoreChartCount.rawValue)
        UserDefaults.standard.removeObject(forKey:UserDefaults.UserDafaultsDeys.pulseChartData.rawValue)
        UserDefaults.standard.removeObject(forKey:UserDefaults.UserDafaultsDeys.HRVChartData.rawValue)
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
