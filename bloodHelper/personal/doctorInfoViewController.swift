//
//  doctorinfoViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/24.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms
import SwiftyJSON
import Alamofire

// 医生个人信息
class doctorInfoViewController: FormViewController {
    
    let row1 = FormRowDescriptor(tag: "doctor_id", type: .text, title: "医生编号：")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    
    func setView(){
        
        self.title = "医生个人信息"
        
        let form = FormDescriptor()
        
        //第一个section分区
        let section1 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //患者填写
        
        row1.configuration.cell.cellClass = inputCell.self
        row1.configuration.cell.placeholder = "请输入编号"
        section1.rows.append(row1)
        
        let row2 = FormRowDescriptor(tag: "doctor_name", type: .text, title: "医生姓名：")
        row2.configuration.cell.cellClass = inputCell.self
        row2.configuration.cell.placeholder = "请输入姓名"
        section1.rows.append(row2)
        
        let row3 = FormRowDescriptor(tag: "doctor_gender", type: .text, title: "医生性别：")
        row3.configuration.cell.cellClass = inputCell.self
        row3.configuration.cell.placeholder = "请输入性别"
        section1.rows.append(row3)
        
        let row4 = FormRowDescriptor(tag: "doctor_age", type: .text, title: "医生年龄：")
        row4.configuration.cell.cellClass = inputCell.self
        row4.configuration.cell.placeholder = "请输入年龄"
        section1.rows.append(row4)
        
        let row5 = FormRowDescriptor(tag: "doctor_id_code", type: .text, title: "所在城市：")
        row5.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row5)
        
        let row6 = FormRowDescriptor(tag: "hospital", type: .text, title: "所在医院：")
        row6.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row6)
        
        let row7 = FormRowDescriptor(tag: "doctor_mobile", type: .text, title: "手机号：")
        row7.configuration.cell.cellClass = inputCell.self
        section1.rows.append(row7)
        
        //第二个section分区
        let section2 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        
        //提交按钮
        let row = FormRowDescriptor(tag: "button", type: .button, title: "提交")
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
        let message = self.form.formValues() as! [String : String]
        print(message)
        
        let loginUrl = xytURL + doctorData
        
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
                        
                        UserDefaults.standard.set(self.row1.value as! String, forKey: doctorID)
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
