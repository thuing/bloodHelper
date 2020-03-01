//
//  patientChangedInputViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/8/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms
import SwiftyJSON
import Alamofire

class patientChangedInputViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "治疗后症状"
        
        //创建form实例
        let form = FormDescriptor()
        form.title = "治疗后症状"
        
        //第一个section分区
        let section1 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //患者填写
        var row = FormRowDescriptor(tag: "patient_id", type: .text, title: "患者填写：")
        row.configuration.cell.cellClass = inputCell.self
        row.configuration.cell.placeholder = "请输入编号"
        section1.rows.append(row)
        
        // 症状
        row = addSingleChoice(tag: "tired", title: "疲乏：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"early_satiation", title: "早饱感：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"abdominal_discomfort", title: "腹部不适：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"poor_activity", title: "运动力不佳：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"poor_attention", title: "注意力不佳：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"night_sweet", title: "夜间盗汗：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"skin_itch", title: "皮肤瘙痒：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"bone_pain", title: "骨痛：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"fever", title: "发热：")
        section1.rows.append(row)
        
        row = addSingleChoice(tag:"weigh_loss", title: "体重下降：")
        section1.rows.append(row)
        
        //治疗药物以及剂量调整情况：
        row = FormRowDescriptor(tag: "os", type: .multilineText, title: "其他特殊\n症状体征：")
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
        print(self.form.formValues())
        let message = self.form.formValues() as! [String : String]
        
        print(message)
        
        let loginUrl = xytURL + symptomData
        
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
    
    
    func addSingleChoice(tag: String ,title: String) -> FormRowDescriptor {
        let row = FormRowDescriptor(tag: tag, type: .segmentedControl, title: title)
        row.configuration.cell.showsInputToolbar = true
        //设置选项值
        row.configuration.selection.options = ["1","0"] as [AnyObject]
        //设置选项值值对应的文字
        row.configuration.selection.optionTitleClosure = { value in
            guard let option = value as? String else { return "" }
            switch option {
            case "1": return "   有    "
            case "0": return "   无        "
            default: return "" }
        }
        //设置默认值
        row.value = "0" as AnyObject
        //设置了默认值，分段选择控件的选中项也要同步修改
        row.configuration.cell.appearance = [
            "segmentedControl.selectedSegmentIndex" : 1 as AnyObject,
            "segmentedControl.tintColor": UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        ]
        return row
    }
}
