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
    
    @IBOutlet weak var HRVOuterView: UIView!
    @IBOutlet weak var HRVChartView: UIView!
    
    @IBOutlet weak var scoreOuterView: UIView!
    @IBOutlet weak var scoreChartView: UIView!
    
    @IBOutlet weak var pulseValue: UILabel!
    @IBOutlet weak var pulseDescr: UILabel!
    
    @IBOutlet weak var HRVValue: UILabel!
    @IBOutlet weak var HRVDesct: UILabel!
    
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var scoreDescr: UILabel!
    
    var pulseChart = LineChartView()
    var HRVChart = LineChartView()
    var scoreChart = LineChartView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pulseChart.delegate = self
//        HRVChart.delegate = self
//        scoreChart.delegate = self
//        initDefaults()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        initPulseChart()
//        initHRVChart()
//        initScoreChart()
    }
    
    private func initPulseChart(){
        pulseChart.frame = CGRect(x:0, y:0,
                                width: pulseChartView.frame.size.width - 20,
                                height: 330
        )
        
        pulseChartView.addSubview(pulseChart)
        
        var entries = [ChartDataEntry]()
        
        let scoreChartData = UserDefaults.standard.pulseChartData
        if(!scoreChartData.isEmpty){
            var count = 0
            for _ in scoreChartData{
                let enrty = BarChartDataEntry(x:Double(count), y:Double(scoreChartData[count]))
                entries.append(enrty)
                count += 1
            }
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        
        dataSet.setColor(NSUIColor.init(.green))
        
        let data = LineChartData(dataSet: dataSet)
        pulseChart.leftAxis.axisMaximum = 100
    
        pulseChart.data = data
    }
    
    private func initHRVChart(){
        HRVChart.frame = CGRect(x:0, y:0,
                                width: HRVChartView.frame.size.width - 20,
                                height: 330
        )
        
        HRVChartView.addSubview(HRVChart)
        
        var entries = [ChartDataEntry]()
        
        let scoreChartData = UserDefaults.standard.HRVChartData
        if(!scoreChartData.isEmpty){
            var count = 0
            for _ in scoreChartData{
                let enrty = BarChartDataEntry(x:Double(count), y:Double(scoreChartData[count]))
                entries.append(enrty)
                count += 1
            }
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        
        dataSet.setColor(NSUIColor.init(.green))
        
        let data = LineChartData(dataSet: dataSet)
        HRVChart.leftAxis.axisMaximum = 100
    
        HRVChart.data = data
    }
    
    private func initScoreChart(){
        scoreChart.frame = CGRect(x:0, y:0,
                                width: scoreChartView.frame.size.width - 20,
                                height: 330
        )
        
        scoreChartView.addSubview(scoreChart)
        
        var entries = [ChartDataEntry]()
        
        let scoreChartData = UserDefaults.standard.scoreChartData
        if(!scoreChartData.isEmpty){
            var count = 0
            for _ in scoreChartData{
                let enrty = BarChartDataEntry(x:Double(count), y:Double(scoreChartData[count]))
                entries.append(enrty)
                count += 1
            }
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        
        dataSet.setColor(NSUIColor.init(.green))
        
        let data = LineChartData(dataSet: dataSet)
        scoreChart.leftAxis.axisMaximum = 100
    
        scoreChart.data = data
    }
    
    private func initDefaults(){
        pulseOuterView.layer.cornerRadius = 20
        HRVOuterView.layer.cornerRadius = 20
        scoreOuterView.layer.cornerRadius = 20
        
        
        let pulseChart = UserDefaults.standard.pulseChartData
        if(!pulseChart.isEmpty){
            let pulseLastValue = pulseChart.last!
            pulseValue.text = pulseLastValue.description
            pulseDescr.textColor = defineColor(value: pulseLastValue)
            pulseDescr.text = defineDescr(value: pulseLastValue)
        }
        
        let HRVChart = UserDefaults.standard.HRVChartData
        if(!HRVChart.isEmpty){
            let HRVLastValue = HRVChart.last!
            HRVValue.text = HRVLastValue.description
            HRVDesct.textColor = defineColor(value: HRVLastValue)
            HRVDesct.text = defineDescr(value: HRVLastValue)
        }
        
        let scoreChart = UserDefaults.standard.scoreChartData
        if(!scoreChart.isEmpty){
            let scoreLastValue = scoreChart.last!
            scoreValue.text = scoreLastValue.description + "%"
            scoreDescr.textColor = defineColor(value: scoreLastValue)
            scoreDescr.text = defineDescr(value: scoreLastValue)
        }
    }
    
    private func defineColor(value: Int) -> UIColor {
        if(value > 70){
            return .green
        } else if (value < 70 && value > 35 ){
            return .orange
        } else {
            return .red
        }
    }
    
    private func defineDescr(value: Int) -> String{
        if(value > 70){
            return "Great"
        } else if (value < 70 && value > 35 ){
            return "Normal"
        } else {
            return "Bad"
        }
    }

    
    @IBAction func backButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(identifier: "measure") as! MeasureViewController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true)
    }
}
