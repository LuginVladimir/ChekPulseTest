//
//  ValForm.swift
//  ChekPulseTest
//
//  Created by lugin on 14.08.23.
//

import Foundation
import Charts

class ValForm : IndexAxisValueFormatter{
        
    override func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if(value < 1 ||  value < 2  ){
            return "dddddd"
        } else {
            return ""
        }
    }
    
}

