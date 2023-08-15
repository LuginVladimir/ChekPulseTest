//
//  ChartHistoryViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 15.08.23.
//

import UIKit

class ChartHistoryViewController: UIViewController {

    @IBOutlet weak var pulseOuterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaults()
        
    }
    
    private func initDefaults(){
        pulseOuterView.layer.cornerRadius = 20
    }
}
