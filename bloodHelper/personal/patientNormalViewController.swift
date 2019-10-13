//
//  patientNormalViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/22.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms
import SwiftyJSON
import Alamofire

class patientNormalViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView(){
        self.title = "初诊情况"
        
        //创建form实例
        let form = FormDescriptor()
        
        //第一个section分区
        let section1 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //患者填写
        var row = FormRowDescriptor(tag: "patient_id", type: .text, title: "患者编号")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //白细胞
        row = FormRowDescriptor(tag: "wbc", type: .text, title: "白细胞(WBC×10⁹)：")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //红细胞
        row = FormRowDescriptor(tag: "rbc", type: .text, title: "红细胞(RBC×10¹²)：")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //血红蛋白
        row = FormRowDescriptor(tag: "hb", type: .text, title: "血红蛋白Hb(g/L)：")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //红细胞比积
        row = FormRowDescriptor(tag: "hct", type: .text, title: "红细胞比积HCT(%)：")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //血小板
        row = FormRowDescriptor(tag: "plt", type: .text, title: "血小板(PLT×10⁹)：")
        row.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row)
        
        //治疗药物以及剂量调整情况：
        row = FormRowDescriptor(tag: "ma", type: .multilineText, title: "治疗药物以及\n剂量调整情况：")
        row.configuration.cell.appearance = [
            "textField.layer.cornerRadius" : 5 as AnyObject,
            "textField.layer.borderColor" : UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor as AnyObject,
            "textField.layer.borderWidth" : 1 as AnyObject,
            "titleLabel.numberOfLines" : 2 as AnyObject
        ]
        section1.rows.append(row)
        
        //第二个section分区
        let section2 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        
        //提交按钮
        row = FormRowDescriptor(tag: "button", type: .button, title: "提交")
        row.configuration.cell.cellClass = buttonCell.self
        row.configuration.button.didSelectClosure = { _ in
            self.submit()
        }
        section2.rows.append(row)
        
        //将两个分区添加到form中
        form.sections = [section1, section2]
        self.form = form 
    }
    
    func submit() {
        //取消当前编辑状态
        self.view.endEditing(true)
        
        //将表单中输入的内容打印出来
        var message = self.form.formValues() as! [String : String]
        
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd"
        let strNowTime = timeFormatter.string(from: date)
        
        message.updateValue(strNowTime, forKey: "first_treatment_date")
        print(message)
        
        let loginUrl = xytURL + bloodFirst
        
        let jsonData = getJSONStringFromDictionary(dictionary: message as NSDictionary)
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
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                    // 请求失败
                else{
                    XYTPrint("请求失败\(String(describing: response.error))")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




