//
//  ChartHistoryViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 15.08.23.
//

import UIKit
import Charts

class ChartHistoryViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var pulseOuterView: UIView!
    
    @IBOutlet weak var pulseChartView: UIView!
    var lineChart = LineChartView()
    let pulseChartData = [20, 50, 70, 40]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        initDefaults()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lineChart.frame = CGRect(x:0, y:0,
                                width: pulseChartView.frame.size.width,
                                height: 330
        )
        
        pulseChartView.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        
        var count = 0
        
        for x in pulseChartData {
            entries.append(ChartDataEntry(x:Double(count), y:Double(x)))
            count += 1
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        
        dataSet.setColor(NSUIColor.init(.green))
        
        let data = LineChartData(dataSet: dataSet)
        lineChart.leftAxis.axisMaximum = 100
        
        lineChart.data = data
    }
    
    private func initDefaults(){
        pulseOuterView.layer.cornerRadius = 20
    }
}
