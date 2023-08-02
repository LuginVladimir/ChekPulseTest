//
//  LTOViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 2.08.23.
//

import UIKit

class LTOViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "LTO1")
            self.view.insertSubview(backgroundImage, at: 0)


    }
    
    @IBAction func toMeasurmentClicked(_ sender: UIButton) {
        let toPage = storyboard?.instantiateViewController(identifier: "measurePage") as! MeasurePageViewController
        toPage.modalPresentationStyle = .fullScreen
        toPage.modalTransitionStyle = .coverVertical
        present(toPage, animated: true)
    }
}
