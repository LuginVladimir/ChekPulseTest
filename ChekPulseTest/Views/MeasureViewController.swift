//
//  MeasureViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 11.08.23.
//

import UIKit
import Charts

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
        chartCount += 1
        let enrty = BarChartDataEntry(x:Double(chartCount), y:Double(scoreRandom))
        entries.append(enrty)
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
    
    private func initChart(){
        barChart.frame = CGRect(x:0, y:0,
                                width: chartView.frame.size.width,
                                height: chartView.frame.size.height
        )
        
        chartView.addSubview(barChart)
        
        
//        for x in 0..<10 {
//            let enrty = BarChartDataEntry(x:Double(x), y:Double(x))
//            entries.append(enrty)
//        }
        
        let dataSet = BarChartDataSet(entries: entries)
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: dataSet)
        
        barChart.data = data
        
    }

    
}
