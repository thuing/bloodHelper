//
//  HBChartViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/5/7.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import Charts

class HBChartViewController: UIViewController {
    
    //折线图
    var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //创建折线图组件对象
        chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 300)
        let xValues = ["7.1","7.5","7.10","7.15","7.30","8.14","8.26","9.10","9.27","10.5"]
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        chartView.legend.form = .none
        chartView.rightAxis.enabled = false //不绘制右侧Y轴文字
        chartView.xAxis.labelPosition = .bottom //x轴显示在下方
        chartView.animate(xAxisDuration: 1)
        
        self.view.addSubview(chartView)
        
        //生成20条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这20条数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "血红细胞")
        chartDataSet.drawCirclesEnabled = false //不绘制转折点
        chartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        chartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        chartView.data = chartData
    }
}
