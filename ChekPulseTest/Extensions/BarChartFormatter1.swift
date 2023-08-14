//
//  BarChartFormatter1.swift
//  ChekPulseTest
//
//  Created by lugin on 14.08.23.
//

import Foundation
import Charts

extension BarChartView {
    
    private class BarChartFormatter: NSObject, AxisValueFormatter {
        
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            
            return "one"
        }
        
    }
    
}
