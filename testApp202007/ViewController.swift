//
//  ViewController.swift
//  testApp202007
//
//  Created by user1 on 2020/07/16.
//  Copyright © 2020 Yuki Hirakawa. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sales = [3205.0, 3120.0, 3424.0, 3312.0, 3612.0, 3594.0, 3648.0, 3845.0, 3585.0, 3917.0, 4014.0]
        setChart(values: sales)
    }
    
    func setChart(values: [Double]) {
        var entry = [ChartDataEntry]()
        
        for i in 0..<values.count {
            entry.append(ChartDataEntry(x: Double(i), y: values[i]))
        }
            
        let dataSet = LineChartDataSet(entries: entry, label: "2020年度売上推移")
        chartView.data = LineChartData(dataSet: dataSet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var myLabel: UILabel!
    
    @IBAction func buttonTapped(sender: UIButton) {
        myLabel.text = "hello Worlddddddd!"
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view.
//    }

}

