//
//  MeasureViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 11.08.23.
//

import UIKit

class MeasureViewController: UIViewController {

    @IBOutlet weak var LastMeasurement: UIView!
    
    @IBOutlet weak var lastMeasureDateLabel: UILabel!
    
    @IBOutlet weak var leftMesureData: UIView!
    @IBOutlet weak var rightMeadureData: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LastMeasurement.layer.cornerRadius = 10
        
        lastMeasureDateLabel.text = "10 Aug, 11:20"
        
        leftMesureData.layer.cornerRadius = 10
        rightMeadureData.layer.cornerRadius = 10


        // Do any additional setup after loading the view.
    }
    

}
