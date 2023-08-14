//
//  MeasureViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 11.08.23.
//

import UIKit
import Charts
import SwiftUI

class MeasureViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var LastMeasurement: UIView!
    @IBOutlet weak var lastMeasureDateLabel: UILabel!
    @IBOutlet weak var leftMesureData: UIView!
    @IBOutlet weak var rightMeadureData: UIView!
    @IBOutlet weak var pulseLabel: UILabel!
    @IBOutlet weak var HRVLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreName: UILabel!
    @IBOutlet weak var chartView: UIView!
    
    var barChart = BarChartView()
    
    var chartCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        initMeasureView()


    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initChart()
    }
    
    @IBAction func measureCliced(_ sender: Any) {
        pulseLabel.text = Int.random(in: 1...100).description
        HRVLabel.text = Int.random(in: 1...100).description
        
        let scoreRandom = Int.random(in: 1...100)
        scoreLabel.text = scoreRandom.description + "%"
        if(scoreRandom > 70){
            scoreLabel.textColor = .green
            scoreName.textColor = .green
            scoreName.text = "Great"
        } else if (scoreRandom < 70 && scoreRandom > 35 ){
            scoreLabel.textColor = .orange
            scoreName.textColor = .orange
            scoreName.text = "Normal"
        } else {
            scoreLabel.textColor = .red
            scoreName.textColor = .red
            scoreName.text = "Bad"
        }
        chartCount += 2
        let enrty = BarChartDataEntry(x:Double(chartCount), y:Double(scoreRandom))

//
        entries.append(enrty)
//
//        let enrty2 = BarChartDataEntry(x:Double(chartCount - 1), y:Double(scoreRandom + 2))
//        entries2.append(enrty2)
    }
    

    private func initMeasureView(){
        LastMeasurement.layer.cornerRadius = 20
        
        lastMeasureDateLabel.text = "10 Aug, 11:20"
        
        pulseLabel.text = "66"
        pulseLabel.textColor = .white
        
        scoreLabel.text = "91%"
        scoreLabel.textColor = .green
        
        HRVLabel.text = "75"
        HRVLabel.textColor = .white
        
        chartView.layer.cornerRadius = 20
    }
    
    var entries = [BarChartDataEntry]()
    var entries2 = [BarChartDataEntry]()
    
    var salesMonths = [String]()
    
    private func initChart(){
        barChart.frame = CGRect(x:0, y:0,
                                width: chartView.frame.size.width,
                                height: chartView.frame.size.height
        )
        
        chartView.addSubview(barChart)
    
        
//        for i in 0...6 {
//
//            let enrty = BarChartDataEntry(x:Double(i), y:Double(i))
//
//            entries.append(enrty)
//        }
        
        
        
        let dataSet = BarChartDataSet(entries: entries, label: "Score chart")

        
        dataSet.colors = ChartColorTemplates.joyful()
        dataSet.setColor(NSUIColor.red)
        
        
//        let dataSet2 = BarChartDataSet(entries: entries2, label: "Score chart2")
//        dataSet2.setColor(NSUIColor.green)
        
 //       let data = BarChartData(dataSets: [dataSet,dataSet2])
            
        let data = BarChartData(dataSet: dataSet)
        data.barWidth = 0.1
        
        let names = ["fr", "f", "erfre","fwerfer","f", "erfre","fwerfer"]
        barChart.xAxis.valueFormatter = ValForm(values: names)

        
        
        // disable grid
        barChart.xAxis.drawGridLinesEnabled = false
//        barChart.xAxis.drawAxisLineEnabled = false
        barChart.leftAxis.drawAxisLineEnabled = false
        barChart.leftAxis.axisMaximum = 100
        barChart.leftAxis.axisMinimum = 0
        barChart.rightAxis.drawGridLinesEnabled = false
        barChart.rightAxis.drawAxisLineEnabled = false
        //barChart.drawGridBackgroundEnabled = false
        // disable axis annotations
        //barChart.xAxis.drawLabelsEnabled = false
        barChart.xAxis.labelTextColor = .lightGray
        barChart.xAxis.labelPosition = .bottom
        barChart.leftAxis.labelTextColor = .darkGray
        barChart.rightAxis.drawLabelsEnabled = false
//        // disable legend
        barChart.legend.enabled = false
//        // disable zoom
//        barChart.pinchZoomEnabled = false
//        barChart.doubleTapToZoomEnabled = false
//        // remove artifacts around chart area
//        barChart.xAxis.enabled = false
//        barChart.leftAxis.enabled = false
//        barChart.rightAxis.enabled = false
//        barChart.drawBordersEnabled = false
//        barChart.minOffset = 0
//        data.drawAxisLineEnabled = false
//        data.drawGridLinesEnabled = false
        
        
        barChart.data = data
    }
}
