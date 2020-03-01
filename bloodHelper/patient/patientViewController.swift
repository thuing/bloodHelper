//
//  patientViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SnapKit
import Charts
import SwiftyJSON
import Alamofire

class patientViewController: UIViewController{
    
    @IBOutlet weak var normalBtn: UIButton!
    
    @IBOutlet weak var linebgView: UIView!
    @IBOutlet weak var symptomBtn: UIButton!
    
    @IBOutlet weak var suggestbg: UIView!
    @IBOutlet weak var suggestionHint: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    let suggestArr = ["适量增","适量减","保持剂量","及时就医","无"]
    var patientListArray: Array<Dictionary<String,JSON>> = [] as! Array<Dictionary>
    var timeList: Array<String> = []
    var wbcList: Array<Double> = []
    var rbcList: Array<Double> = []
    var hbList: Array<Double> = []
    var hctList: Array<Double> = []
    var pltList: Array<Double> = []

    //折线图
    let chartView1: LineChartView! = LineChartView()
    let chartView2: LineChartView! = LineChartView()
    let chartView3: LineChartView! = LineChartView()
    let chartView4: LineChartView! = LineChartView()
    let chartView5: LineChartView! = LineChartView()
    let chartView6: LineChartView! = LineChartView()
    var currentPosition = 0
    
  
    @IBAction func showBloodDetail(_ sender: Any) {
        let pVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "bloodDetailViewController")
            as? bloodDetailViewController
        pVC?.patientListArray = self.patientListArray
        self.navigationController?.pushViewController(pVC!, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "血友通"
        setView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showPatientblood()
        
        doctorSuggest()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.patientListArray.removeAll()
        self.wbcList.removeAll()
        self.rbcList.removeAll()
        self.hbList.removeAll()
        self.pltList.removeAll()
        self.hctList.removeAll()
        self.timeList.removeAll()
    }
    
    let screen_width = 346
    let screen_height = 260
    
    @IBAction func allLine(_ sender: Any) {
        if currentPosition != 0 {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    @IBAction func wbcLine(_ sender: Any) {
        if currentPosition != 1 {
            currentPosition = 1
            self.scrollView.setContentOffset(CGPoint(x: screen_width, y: 0), animated: true)
        }
    }
    
    @IBAction func rbcLine(_ sender: Any) {
        if currentPosition != 2 {
            currentPosition = 2
            self.scrollView.setContentOffset(CGPoint(x: 2*screen_width, y: 0), animated: true)
        }
    }
    
    @IBAction func hbLine(_ sender: Any) {
        if currentPosition != 3 {
            currentPosition = 3
            self.scrollView.setContentOffset(CGPoint(x: 3*screen_width, y: 0), animated: true)
        }
    }
    
    @IBAction func hctLine(_ sender: Any) {
        if currentPosition != 4 {
            currentPosition = 4
            self.scrollView.setContentOffset(CGPoint(x: 4*screen_width, y: 0), animated: true)
            
        }
    }
    
    @IBAction func pltLine(_ sender: Any) {
        if currentPosition != 5 {
            currentPosition = 5
            self.scrollView.setContentOffset(CGPoint(x: 5*screen_width, y: 0), animated: true)
        }
    }
    
    func setView(){
        setBtn(btn: normalBtn)
        setBtn(btn: symptomBtn)
        
       setShadow(view: suggestbg, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        
        setShadow(view: linebgView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 0.0, height: -5.0), opacity: 1, radius: 5)
        
        chartView1.frame = CGRect(x: 0, y: 0, width: screen_width, height: screen_height)
        chartView2.frame = CGRect(x: screen_width, y: 0, width: screen_width, height: screen_height)
        chartView3.frame = CGRect(x: screen_width*2, y: 0, width: screen_width, height: screen_height)
        chartView4.frame = CGRect(x: screen_width*3, y: 0, width: screen_width, height: screen_height)
        chartView5.frame = CGRect(x: screen_width*4, y: 0, width: screen_width, height: screen_height)
        chartView6.frame = CGRect(x: screen_width*5, y: 0, width: screen_width, height: screen_height)
        
        self.scrollView.contentSize = CGSize(width: 6*self.view.frame.width, height: 0)
        
    }
    
    func setBtn(btn:UIButton) -> Void {
        
        btn.layer.cornerRadius = 50
        btn.layer.shadowOpacity = 0.35 //阴影区域透明度
        btn.layer.shadowColor = UIColor.gray.cgColor // 阴影区域颜色
        btn.layer.shadowOffset = CGSize(width: 3, height: 3) //阴影区域范围
    }
    
    func setline(chartView:LineChartView){
        
        chartView.rightAxis.enabled = false //不绘制右侧Y轴文字
        chartView.xAxis.labelPosition = .bottom //x轴显示在下方
        chartView.animate(xAxisDuration: 1)
        
        let xValues = timeList
        chartView.drawBordersEnabled = true  //绘制图形区域边框
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        chartView.xAxis.labelCount = 7
        chartView.xAxis.granularity = 1
        chartView.xAxis.axisMinimum = 0
        chartView.xAxis.axisMaximum = 6
        chartView.xAxis.forceLabelsEnabled = true
        chartView.xAxis.granularityEnabled = true
        chartView.setVisibleXRangeMaximum(10)
        chartView.leftAxis.drawLimitLinesBehindDataEnabled = true
        
        self.scrollView.addSubview(chartView)
    }
    
    // 显示全部图像
    func lineShow(){
        
        let chartArr = [chartView1,chartView2,chartView3,chartView4,chartView5,chartView6]
        for index in chartArr {
            self.setline(chartView: index!)
        }
        
        var wbcDataEntries = [ChartDataEntry]()
        for i in 0..<wbcList.count {
            
            let entry = ChartDataEntry.init(x: Double(i), y: Double(wbcList[i]))
            wbcDataEntries.append(entry)
        }
        
        var rbcDataEntries = [ChartDataEntry]()
        for i in 0..<rbcList.count {
            
            let entry = ChartDataEntry.init(x: Double(i), y: Double(rbcList[i]))
            rbcDataEntries.append(entry)
        }
        
        var hbDataEntries = [ChartDataEntry]()
        for i in 0..<hbList.count {
            
            let entry = ChartDataEntry.init(x: Double(i), y: Double(hbList[i]))
            hbDataEntries.append(entry)
        }
        
        var hctDataEntries = [ChartDataEntry]()
        for i in 0..<hctList.count {
            
            let entry = ChartDataEntry.init(x: Double(i), y: Double(hctList[i]))
            hctDataEntries.append(entry)
        }
        
        var pltDataEntries = [ChartDataEntry]()
        for i in 0..<pltList.count {
            
            let entry = ChartDataEntry.init(x: Double(i), y: Double(pltList[i]))
            pltDataEntries.append(entry)
        }
        
        let wbcChartDataSet = LineChartDataSet(values: wbcDataEntries, label: "白细胞")
        let wbcColor = ChartColorTemplates.colorFromString("#40E0D0")
        wbcChartDataSet.colors = [wbcColor]
        wbcChartDataSet.drawCirclesEnabled = false //不绘制转折点
        wbcChartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        wbcChartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        let rbcChartDataSet = LineChartDataSet(values: rbcDataEntries, label: "红细胞")
        let rbcColor = ChartColorTemplates.colorFromString("#DB4B41")
        rbcChartDataSet.colors = [rbcColor]
        rbcChartDataSet.drawCirclesEnabled = false //不绘制转折点
        rbcChartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        rbcChartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        let hbChartDataSet = LineChartDataSet(values: hbDataEntries, label: "血红蛋白")
        let hbColor = ChartColorTemplates.colorFromString("#FF6400")
        hbChartDataSet.colors = [hbColor]
        hbChartDataSet.drawCirclesEnabled = false //不绘制转折点
        hbChartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        hbChartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        let hctChartDataSet = LineChartDataSet(values: hctDataEntries, label: "红细胞比积")
        let hctColor = ChartColorTemplates.colorFromString("#F2AD00")
        hctChartDataSet.colors = [hctColor]
        hctChartDataSet.drawCirclesEnabled = false //不绘制转折点
        hctChartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        hctChartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        let pltChartDataSet = LineChartDataSet(values: pltDataEntries, label: "血小板")
        let pltColor = ChartColorTemplates.colorFromString("#100DFF")
        pltChartDataSet.colors = [pltColor]
        pltChartDataSet.drawCirclesEnabled = false //不绘制转折点
        pltChartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        pltChartDataSet.mode = .horizontalBezier  //贝塞尔曲线
        
        let chartData1 = LineChartData(dataSets: [wbcChartDataSet,rbcChartDataSet,hbChartDataSet,hctChartDataSet,pltChartDataSet])
        let chartData2 = LineChartData(dataSets: [wbcChartDataSet])
        let chartData3 = LineChartData(dataSets: [rbcChartDataSet])
        let chartData4 = LineChartData(dataSets: [hbChartDataSet])
        let chartData5 = LineChartData(dataSets: [hctChartDataSet])
        let chartData6 = LineChartData(dataSets: [pltChartDataSet])
        
        //最高界限
        var limitLine1 = ChartLimitLine(limit: 10, label: "最高标准：10")
        chartView2.leftAxis.addLimitLine(limitLine1)
        
        //最低界限
        var limitLine2 = ChartLimitLine(limit: 4, label: "最低标准：4")
        chartView2.leftAxis.addLimitLine(limitLine2)
        
        //最高界限
        limitLine1 = ChartLimitLine(limit: 5.1, label: "最高标准：5.1")
        chartView3.leftAxis.addLimitLine(limitLine1)
        
        //最低界限
        limitLine2 = ChartLimitLine(limit: 3.8, label: "最低标准：3.8")
        chartView3.leftAxis.addLimitLine(limitLine2)
        
        //最高界限
        limitLine1 = ChartLimitLine(limit: 150, label: "最高标准：150")
        chartView4.leftAxis.addLimitLine(limitLine1)
        
        //最低界限
        limitLine2 = ChartLimitLine(limit: 115, label: "最低标准：115")
        chartView4.leftAxis.addLimitLine(limitLine2)
        
        //最高界限
        limitLine1 = ChartLimitLine(limit: 45, label: "最高标准：45")
        chartView5.leftAxis.addLimitLine(limitLine1)
        
        //最低界限
        limitLine2 = ChartLimitLine(limit: 35, label: "最低标准：35")
        chartView5.leftAxis.addLimitLine(limitLine2)
        
        //最高界限
        limitLine1 = ChartLimitLine(limit: 350, label: "最高标准：350")
        chartView6.leftAxis.addLimitLine(limitLine1)
        
        //最低界限
        limitLine2 = ChartLimitLine(limit: 125, label: "最低标准：125")
        chartView6.leftAxis.addLimitLine(limitLine2)
        
        
        //设置折现图数据
        chartView1.data = chartData1
        chartView2.data = chartData2
        chartView3.data = chartData3
        chartView4.data = chartData4
        chartView5.data = chartData5
        chartView6.data = chartData6
    }
    
    // 获取患者血常规信息
    func showPatientblood() {
        
        let loginUrl = xytURL + doctorPatientBlood
        
        UserDefaults.standard.set("1659105", forKey: "patientID")
        let doctorId = UserDefaults.standard.string(forKey: "doctorID")
        let patientID = UserDefaults.standard.string(forKey: "patientID")
        
        let bodyDic:Dictionary = ["doctor_id": doctorId ?? "", "patient_id": patientID  ]
        print(bodyDic)
        let jsonData = getJSONStringFromDictionary(dictionary: bodyDic as NSDictionary)
        
        let url = URL(string: loginUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON {
            (response) in
            
            // 请求成功
            if(response.error == nil){
                let jsonValue = response.result.value
                // 得到info
                if jsonValue != nil {
                    XYTPrint(jsonValue)
                    let json = JSON(jsonValue!)
                    let result = json["result"].stringValue
                    
                    if result == "success" {
                        
                        
                        for (_,subJson):(String, JSON) in json["data"] {
                            self.patientListArray.append(subJson.dictionaryValue)
                        }
                        
                        //根据时间进行排序
                        self.patientListArray = self.patientListArray.sorted(by: { (array1, array2) -> Bool in
                            let obj1 = array1["record_time"]?.stringValue
                            let obj2 = array2["record_time"]?.stringValue
                            let dateFormater = DateFormatter()
                            dateFormater.dateFormat = "YYYY-MM-dd"
                            let date1 = dateFormater.date(from: obj1!)
                            let date2 = dateFormater.date(from: obj2!)
                            return date1?.compare(date2!) == .orderedAscending
                            
                        })
                        
                        XYTPrint(self.patientListArray)
                        
                        // time
                        for index in self.patientListArray{
                            let time = index["record_time"]!.stringValue
                            let shortTime = time.suffix(5)
                            let wbc = index["wbc"]?.doubleValue
                            let rbc = index["rbc"]?.doubleValue
                            let hb = index["hb"]?.doubleValue
                            let hct = index["hct"]?.doubleValue
                            let plt = index["plt"]?.doubleValue
                            
                            self.timeList.append(String(shortTime))
                            self.wbcList.append(wbc!)
                            self.rbcList.append(rbc!)
                            self.hbList.append(hb!)
                            self.hctList.append(hct!)
                            self.pltList.append(plt!)
                        }
                        
                        self.lineShow()
                    }
                }
                    // 请求失败
                else{
                    XYTPrint("请求失败\(String(describing: response.error))")
                }
            }
        }
    }
    
    // 获取医生用药建议
    func doctorSuggest() {
        
        let loginUrl = xytURL + patientMedical
        
        let patientID = UserDefaults.standard.string(forKey: "patientID")
        
        let bodyDic:Dictionary = ["patient_id": patientID]
        XYTPrint(bodyDic)
        let jsonData = getJSONStringFromDictionary(dictionary: bodyDic as NSDictionary)
        
        let url = URL(string: loginUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON {
            (response) in
            
            // 请求成功
            if(response.error == nil){
                let jsonValue = response.result.value
                // 得到info
                if jsonValue != nil {
                    XYTPrint(jsonValue)
                    let json = JSON(jsonValue!)
                    let result = json["result"].stringValue
                    
                    if result == "success" {
                        let status = json["data"]["status"].intValue
                        let lastStatus = UserDefaults.standard.integer(forKey: "lastStatus")
                        if lastStatus != status {
                            UserDefaults.standard.set(status, forKey: "lastStatus")
                            self.suggestionHint.isHidden = false
                        } else{
                            self.suggestionHint.isHidden = true
                        }
                        self.suggestionLabel.text = self.suggestArr[status - 1]
                    }
                }
                    // 请求失败
                else{
                    XYTPrint("请求失败\(String(describing: response.error))")
                }
            }
        }
    }
    
    // 跳转到血常规变化填写页面
    @IBAction func normalBtnClick(_ button :UIButton) {
        let pVC = patientNormalInputViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到治疗后症状填写页面
    @IBAction func changeBtnClick(_ button :UIButton) {
        let pVC = patientChangedInputViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    
    // 跳转到症状变化图表
    @IBAction func ChangedChartChart(_ button :UIButton){
        
        let pVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "symptomDetailViewController")
            as? symptomDetailViewController
        let patientID = UserDefaults.standard.string(forKey: "patientID")
        pVC?.patientID = patientID ?? ""
        self.navigationController?.pushViewController(pVC!, animated: false)
    }
    

}
