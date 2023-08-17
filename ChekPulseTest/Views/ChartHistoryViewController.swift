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
    
    @IBOutlet weak var scoreOuterView: UIView!
    
    var lineChart = LineChartView()
    
    
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
        
        let scoreChartData = UserDefaults.standard.scoreChartData//ЭТО СКОР!!  поменять на пульс!!!!
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
        lineChart.leftAxis.axisMaximum = 100
        
        lineChart.data = data
    }
    
    private func initDefaults(){
        pulseOuterView.layer.cornerRadius = 20
        HRVOuterView.layer.cornerRadius = 20
        scoreOuterView.layer.cornerRadius = 20
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(identifier: "measure") as! MeasureViewController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true)
    }
}
