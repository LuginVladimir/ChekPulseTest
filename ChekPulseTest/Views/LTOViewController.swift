//
//  LTOViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 2.08.23.
//

import UIKit

class LTOViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.isHidden = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "LTO1")
            self.view.insertSubview(backgroundImage, at: 0)
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.closeButton.isHidden = false
        }


    }
    
    @IBAction func toMeasurmentClicked(_ sender: UIButton) {
        let toPage = storyboard?.instantiateViewController(identifier: "measure") as! MeasureViewController
        toPage.modalPresentationStyle = .fullScreen
        toPage.modalTransitionStyle = .coverVertical
        present(toPage, animated: true)
    }
    @IBAction func supscribeClicked(_ sender: UIButton) {
        UserDefaults.standard.hasSubscription = true
        let controller = self.storyboard?.instantiateViewController(identifier: "measure") as! MeasureViewController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true)
    }
}
