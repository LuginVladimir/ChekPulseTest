//
//  ChartControllerViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 12.08.23.
//

import UIKit
import Charts

class ChartControllerViewController: UIViewController, ChartViewDelegate {
            

    var barChart = BarChartView()
    var lineChart = LineChartView()
    var pieChart = PieChartView()
    
    @IBOutlet weak var chartUiVewi: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        lineChart.delegate = self
        pieChart.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        goBarCahrt()
        //goLineCahrt()
        //goPieCahrt()
    }
    
    private func goBarCahrt(){
        barChart.frame = CGRect(x:0, y:0,
                                width: chartUiVewi.frame.size.width,
                                height: chartUiVewi.frame.size.height
        )
        
        //barChart.center = chartUiVewi.center
        chartUiVewi.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10 {
            let enrty = BarChartDataEntry(x:Double(x), y:Double(x))
            entries.append(enrty)
        }
        
        let dataSet = BarChartDataSet(entries: entries)
        
        //dataSet.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: dataSet)
        
        barChart.data = data
    }
    
    private func goLineCahrt(){
        lineChart.frame = CGRect(x:0, y:0,
                                width: self.view.frame.size.width,
                                height: 400
        )
        
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x:Double(x), y:Double(x)))
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        
        dataSet.colors = ChartColorTemplates.material()
        
        let data = LineChartData(dataSet: dataSet)
        
        lineChart.data = data
    }
    
    private func goPieCahrt(){
        pieChart.frame = CGRect(x:0, y:0,
                                width: self.view.frame.size.width,
                                height: 400
        )
        
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x:Double(x), y:Double(x)))
        }
        
        let dataSet = PieChartDataSet(entries: entries)
        
        dataSet.colors = ChartColorTemplates.colorful()
        
        let data = PieChartData(dataSet: dataSet)
        
        pieChart.data = data
    }
}
