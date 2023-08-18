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
    @IBOutlet weak var allMeasurementsView: UIView!
    @IBOutlet weak var heartScoreView: UIView!
    @IBOutlet weak var heartScoreLabel: UILabel!
    @IBOutlet weak var chartOuterView: UIView!
    @IBOutlet weak var measureButton: UIButton!
    
    var barChart = BarChartView()
    var entries = [BarChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          initDefault()
        barChart.delegate = self
        initMeasureView()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initChart()
    }
    
    @IBAction func measureCliced(_ sender: Any) {
        let pulse = Int.random(in: 1...100)
        pulseLabel.text = pulse.description
        let hrv = Int.random(in: 1...100)
        HRVLabel.text = hrv.description
        
        let heartScore = Int.random(in: 20...120)
        heartScoreLabel.text = heartScore.description
        
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
        
        var currentCount = UserDefaults.standard.scoreChartCount
        currentCount += 1
        UserDefaults.standard.removeObject(forKey: UserDefaults.UserDafaultsDeys.scoreChartCount.rawValue)
        UserDefaults.standard.scoreChartCount = currentCount
        
        updateScoreData(data: scoreRandom)
        updatePulseData(data: pulse)
        updateHRVData(data: hrv)
    }
    
    private func updateScoreData(data: Int){
        var scoreChartData = UserDefaults.standard.scoreChartData
        scoreChartData.append(data)
        UserDefaults.standard.removeObject(forKey: UserDefaults.UserDafaultsDeys.scoreChartData.rawValue)
        UserDefaults.standard.scoreChartData = scoreChartData
    }
    
    private func updatePulseData(data: Int){
        var scoreChartData = UserDefaults.standard.pulseChartData
        scoreChartData.append(data)
        UserDefaults.standard.removeObject(forKey: UserDefaults.UserDafaultsDeys.pulseChartData.rawValue)
        UserDefaults.standard.pulseChartData = scoreChartData
    }
    
    private func updateHRVData(data: Int){
        var scoreChartData = UserDefaults.standard.HRVChartData
        scoreChartData.append(data)
        UserDefaults.standard.removeObject(forKey: UserDefaults.UserDafaultsDeys.HRVChartData.rawValue)
        UserDefaults.standard.HRVChartData = scoreChartData
    }
    

    private func initMeasureView(){
        LastMeasurement.layer.cornerRadius = 20
        allMeasurementsView.layer.cornerRadius = 20
        heartScoreView.layer.cornerRadius = 20
        chartOuterView.layer.cornerRadius = 20

        pulseLabel.text = "66"
        pulseLabel.textColor = .white
        
        scoreLabel.text = "91%"
        scoreLabel.textColor = .green
        
        HRVLabel.text = "75"
        HRVLabel.textColor = .white
        
        chartView.layer.cornerRadius = 20
    }
    
    private func initChart(){
        barChart.frame = CGRect(x:0, y:0,
                                width: chartView.frame.size.width,
                                height: chartView.frame.size.height
        )
        
        chartView.addSubview(barChart)
        
        let scoreChartData = UserDefaults.standard.scoreChartData
        if(!scoreChartData.isEmpty){
            var count = 0
            for _ in scoreChartData{
                let enrty = BarChartDataEntry(x:Double(count), y:Double(scoreChartData[count]))
                entries.append(enrty)
                count += 1
            }
        }
        let dataSet = BarChartDataSet(entries: entries, label: "Score chart")

        dataSet.setColor(NSUIColor.init(.red))
        dataSet.valueColors = [.white]
    
        let data = BarChartData(dataSet: dataSet)
        data.barWidth = 0.1
    
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.leftAxis.drawAxisLineEnabled = false
        barChart.leftAxis.axisMaximum = 100
        barChart.leftAxis.axisMinimum = 0
        barChart.rightAxis.drawGridLinesEnabled = false
        barChart.rightAxis.drawAxisLineEnabled = false
        barChart.xAxis.labelTextColor = .lightGray
        barChart.xAxis.labelPosition = .bottom
        barChart.leftAxis.labelTextColor = .darkGray
        barChart.rightAxis.drawLabelsEnabled = false
        barChart.legend.enabled = false
        
        barChart.data = data
    }
    
    private func initDefault(){
        let pulseChart = UserDefaults.standard.pulseChartData
        if(!pulseChart.isEmpty){
            let pulseLastValue = pulseChart.last!
            pulseLabel.text = pulseLastValue.description
            heartScoreLabel.text = pulseLastValue.description
        }
        
        let HRVChart = UserDefaults.standard.HRVChartData
        if(!HRVChart.isEmpty){
            let HRVLastValue = HRVChart.last!
            HRVLabel.text = HRVLastValue.description
        }
        
        let scoreChart = UserDefaults.standard.scoreChartData
        if(!scoreChart.isEmpty){
            let scoreLastValue = scoreChart.last!
            scoreLabel.text = scoreLastValue.description + "%"
        }
    }
    
    
    @IBAction func viewAllClicked(_ sender: Any) {
                let controller = self.storyboard?.instantiateViewController(identifier: "ChartHistory") as! ChartHistoryViewController
                                controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
                self.present(controller, animated: true)
        
            }
}

