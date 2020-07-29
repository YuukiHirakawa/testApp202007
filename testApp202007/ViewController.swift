//
//  ViewController.swift
//  testApp202007
//
//  Created by user1 on 2020/07/16.
//  Copyright © 2020 Yuki Hirakawa. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var barView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sales = [3205.0, 3120.0, 3424.0, 3312.0, 3612.0, 3594.0, 3648.0, 3845.0, 3585.0, 3917.0, 4014.0]
        setChart(values: sales)
        
        updateChartWithData()
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
    
    /// 「追加ボタン」タップ時
    ///
    /// - parameter sender: <#sender description#>
    @IBAction func btnAddTapped(_ sender: AnyObject) {
    
        if let value = tfValue.text , value != "" {
          
            //VisitorCoundインスタンスを作成
            let visitorCount = VisitorCount()

            //カウント値をテキストフィールドから取得して設定
            visitorCount.count = (NumberFormatter().number(from: value)?.intValue)!

            //保存
            visitorCount.save()

            //テキストフィールドを空にする
            tfValue.text = ""
            
        }
        //チャートをアップデート
        updateChartWithData()
    }
    
    
    /// チャート更新
    func updateChartWithData() {

        //データ配列を定義・・・（１）
        var dataEntries: [BarChartDataEntry] = []

        //データベースから取得
        let visitorCounts = getVisitorCountsFromDatabase()
        
        // 取得したデータを（１）のデータ配列に設定
        for i in 0..<visitorCounts.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
        }
        
        // チャート情報にラベルとデータを設定
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "訪問者数")
        let chartData = BarChartData(dataSet: chartDataSet)

        // viewにチャートデータを設定
        barView.data = chartData
    }
    
    /// データベース（RealmSwift）からVisitorCountsのデータを取得する
    ///
    /// - returns: <#return value description#>
    func getVisitorCountsFromDatabase() -> Results<VisitorCount> {
        do {
            let realm = try Realm()
            return realm.objects(VisitorCount.self)

        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
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

