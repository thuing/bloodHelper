//
//  patientVisitViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms

class patientVisitViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView(){
        
        self.title = "患者就诊信息"
        
        let form = FormDescriptor()
        
        //第一个section分区
        let section1 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //患者填写
        var row = FormRowDescriptor(tag: "mnum", type: .text, title: "就诊卡号：")
        row.configuration.cell.cellClass = inputCell.self
        row.configuration.cell.placeholder = "请输入就诊卡号"
        section1.rows.append(row)
        
        row = FormRowDescriptor(tag: "dnum", type: .text, title: "医生编号：")
        row.configuration.cell.cellClass = inputCell.self
        row.configuration.cell.placeholder = "请输入编号"
        section1.rows.append(row)
        
        row = FormRowDescriptor(tag: "first_visit_date", type: .date, title: "初诊日期：")
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
    
    //登录按钮点击
    func submit() {
        //取消当前编辑状态
        self.view.endEditing(true)
        
        //将表单中输入的内容打印出来
        let message = self.form.formValues().description
        print(message)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


