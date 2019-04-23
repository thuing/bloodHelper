//
//  patientChangedViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientChangedViewController: UIViewController {
    
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
        
        let table7 = UIView()
        bgView.addSubview(table7)
        table7.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table6.snp.bottom)
        }
        
        let table8 = UIView()
        bgView.addSubview(table8)
        table8.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(table7.snp.bottom)
        }
        
//        let table9 = UIView()
//        bgView.addSubview(table9)
//        table9.snp.makeConstraints{(make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(table8.snp.bottom)
//        }
//
//        let table10 = UIView()
//        bgView.addSubview(table10)
//        table10.snp.makeConstraints{(make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(table9.snp.bottom)
//        }
//
//        let table11 = UIView()
//        bgView.addSubview(table11)
//        table11.snp.makeConstraints{(make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(table10.snp.bottom)
//        }
//
//        let table12 = UIView()
//        bgView.addSubview(table12)
//        table12.snp.makeConstraints{(make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(table11.snp.bottom)
//        }
//
//        let table13 = UIView()
//        bgView.addSubview(table13)
//        table13.snp.makeConstraints{(make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(table12.snp.bottom)
//        }
//
        
        let table14 = UIView()
        bgView.addSubview(table14)
        table14.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalTo(table7.snp.bottom)
        }
        
        tableTool.tableRightCell(table:table1,labelStr: "患者编号：", placeholderStr: "请输入编号")
        tableTool.tableRightCell(table:table2,labelStr: "开始治疗日期：", placeholderStr: "")
        tableTool.tableRightCell(table:table3,labelStr: "评估日期：", placeholderStr: "")
        tableTool.tableChoosenCell(table: table4, labelStr: "疲乏：", trueStr: "有", falseStr: "无")
        tableTool.tableChoosenCell(table: table5, labelStr: "早饱感：", trueStr: "有", falseStr: "无")
        tableTool.tableChoosenCell(table: table6, labelStr: "腹部不适：", trueStr: "有", falseStr: "无")
        tableTool.tableChoosenCell(table: table7, labelStr: "运动力不佳：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table8, labelStr: "注意力不佳：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table9, labelStr: "夜间盗汗：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table10, labelStr: "皮肤瘙痒：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table11, labelStr: "骨痛：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table12, labelStr: "发热：", trueStr: "有", falseStr: "无")
//        tableTool.tableChoosenCell(table: table13, labelStr: "体重下降：", trueStr: "有", falseStr: "无")
        tableTool.tableTextAreaCell(table: table14, labelStr: "其他特殊\n症状体征：")
        
        let submitBtn = UIButton()
        bgView.addSubview(submitBtn)
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.layer.cornerRadius = 5
        submitBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        submitBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(table14.snp.bottom).offset(10)
        }
    }
    
    
}
