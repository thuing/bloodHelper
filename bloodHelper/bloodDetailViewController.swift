//
//  bloodDetailViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/10/13.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

// 血常规详情
class bloodDetailViewController: UIViewController {
    
    var patientListArray: Array<Dictionary<String,JSON>> = [] as! Array<Dictionary>
    var currentPosition = 0

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var wbcLabel: UILabel!
    @IBOutlet weak var rbcLabel: UILabel!
    @IBOutlet weak var hbLabel: UILabel!
    @IBOutlet weak var hctLabel: UILabel!
    @IBOutlet weak var pltLabel: UILabel!
    
    @IBOutlet weak var wbcView: UIView!
    @IBOutlet weak var rbcView: UIView!
    @IBOutlet weak var hbView: UIView!
    @IBOutlet weak var hctView: UIView!
    @IBOutlet weak var pltView: UIView!
    
    @IBAction func previousAct(_ sender: Any) {
        if currentPosition != 0 {
            currentPosition = currentPosition - 1
            self.wbcLabel.text = patientListArray[currentPosition]["wbc"]?.stringValue
            self.rbcLabel.text = patientListArray[currentPosition]["rbc"]?.stringValue
            self.hbLabel.text = patientListArray[currentPosition]["hb"]?.stringValue
            self.hctLabel.text = patientListArray[currentPosition]["hct"]?.stringValue
            self.pltLabel.text = patientListArray[currentPosition]["plt"]?.stringValue
            self.timeLabel.text = patientListArray[currentPosition]["record_time"]?.stringValue
        }
        
    }
    
    @IBAction func nextAct(_ sender: Any) {
        if currentPosition != patientListArray.count - 1 {
            currentPosition = currentPosition + 1
            self.wbcLabel.text = patientListArray[currentPosition]["wbc"]?.stringValue
            self.rbcLabel.text = patientListArray[currentPosition]["rbc"]?.stringValue
            self.hbLabel.text = patientListArray[currentPosition]["hb"]?.stringValue
            self.hctLabel.text = patientListArray[currentPosition]["hct"]?.stringValue
            self.pltLabel.text = patientListArray[currentPosition]["plt"]?.stringValue
            self.timeLabel.text = patientListArray[currentPosition]["record_time"]?.stringValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XYTPrint(patientListArray)
        currentPosition = patientListArray.count - 1

        setView()
    }
    
    func setView() {
        setShadow(view: wbcView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        setShadow(view: rbcView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        setShadow(view: rbcView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        setShadow(view: rbcView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        setShadow(view: rbcView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        
        let patient = patientListArray[currentPosition]
        XYTPrint(patient["rbc"]?.stringValue)
        
        self.timeLabel.text = patient["record_time"]?.stringValue
        self.rbcLabel.text = patient["rbc"]?.stringValue
        self.hbLabel.text = patient["hb"]?.string
        self.hctLabel.text = patient["hct"]?.string
        self.pltLabel.text = patient["plt"]?.string
        self.wbcLabel.text = patient["wbc"]?.string
    }
    
}
