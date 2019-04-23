//
//  patientInfoViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit


class patientInfoViewController: UIViewController {
    let bgView = UIView()
    let tableTool = UITableTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setView()
    }
        
    func setView(){
            
        bgView.backgroundColor = UIColor.white
        view.addSubview(bgView)
        bgView.snp.makeConstraints{(make) in
            make.width.height.equalToSuperview()
            make.top.equalTo(60)
            make.center.equalToSuperview()
        }
            
        let table1 = UIView()
        bgView.addSubview(table1)
        table1.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(10)
        }
            
        let table2 = UIView()
        bgView.addSubview(table2)
        table2.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table1.snp.bottom)
        }
            
        let table3 = UIView()
        bgView.addSubview(table3)
        table3.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table2.snp.bottom)
        }
            
        let table4 = UIView()
        bgView.addSubview(table4)
        table4.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table3.snp.bottom)
        }
            
        let table5 = UIView()
        bgView.addSubview(table5)
        table5.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table4.snp.bottom)
        }
            
        let table6 = UIView()
        bgView.addSubview(table6)
        table6.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table5.snp.bottom)
        }
            
        tableTool.tableCell(table:table1,labelStr: "患者编号：", placeholderStr: "请输入编号")
        tableTool.tableCell(table:table2,labelStr: "患者姓名：", placeholderStr: "请输入姓名")
        tableTool.tableCell(table:table3,labelStr: "患者性别：", placeholderStr: "请输入性别")
        tableTool.tableCell(table:table4,labelStr: "患者年龄：", placeholderStr: "请输入年龄")
        tableTool.tableCell(table:table5,labelStr: "手机号码：", placeholderStr: "请输入手机号")
        tableTool.tableCell(table:table6,labelStr: "验证码：", placeholderStr: "请输入验证码")
            
        let getCodeBtn = UIButton()
        table5.addSubview(getCodeBtn)
        getCodeBtn.setTitle("获取验证码", for: .normal)
        getCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        getCodeBtn.setTitleColor(UIColor(red: 60.0 / 255.0, green: 197.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0), for: .normal)
        getCodeBtn.layer.cornerRadius = 10
        getCodeBtn.layer.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0).cgColor
        getCodeBtn.snp.makeConstraints{(make) in
            make.width.equalTo(90)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalTo(table5.snp.right).offset(-10)
        }
        
        let submitBtn = UIButton()
        bgView.addSubview(submitBtn)
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.layer.cornerRadius = 5
        submitBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        submitBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(table6.snp.bottom).offset(10)
        }
            
            //        let placeholserAttributes = [NSAttributedStringKey.foregroundColor : UIColor.blue,NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)]
            //phoneTextField.keyboardType = .phonePad
            
            
            
    }
        
        
}

