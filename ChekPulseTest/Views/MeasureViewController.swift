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
    
    @IBOutlet weak var pulseLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HRVLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LastMeasurement.layer.cornerRadius = 10
        
        lastMeasureDateLabel.text = "10 Aug, 11:20"
        
        pulseLabel.text = "66"
        pulseLabel.textColor = .white
        
        scoreLabel.text = "91%"
        scoreLabel.textColor = .white
        
        HRVLabel.text = "75"
        HRVLabel.textColor = .green
    }
    
    @IBAction func measureCliced(_ sender: Any) {
        pulseLabel.text = Int.random(in: 1...100).description
        HRVLabel.text = Int.random(in: 1...100).description
        
        let scoreRandom = Int.random(in: 1...100)
        scoreLabel.text = scoreRandom.description + "%"
        if(scoreRandom > 70){
            scoreLabel.textColor = .green
        } else if (scoreRandom < 70 && scoreRandom > 35 ){
            scoreLabel.textColor = .orange
        } else {
            scoreLabel.textColor = .red
        }
    }
    
}
