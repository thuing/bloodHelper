//
//  patientNormalViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/22.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientNormalViewController: UIViewController {
    
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
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalTo(table6.snp.bottom)
        }
        
        tableTool.tableRightCell(table:table1,labelStr: "初诊日期：", placeholderStr: "")
        tableTool.tableRightCell(table:table2,labelStr: "白细胞(WBC×10⁹)：", placeholderStr: "")
        tableTool.tableRightCell(table:table3,labelStr: "红细胞(RBC×10¹²)：", placeholderStr: "")
        tableTool.tableRightCell(table:table4,labelStr: "血红蛋白Hb(g/L)：", placeholderStr: "")
        tableTool.tableRightCell(table:table5,labelStr: "红细胞比积HCT(%)：", placeholderStr: "")
        tableTool.tableRightCell(table:table6,labelStr: "血小板(PLT×10⁹)：", placeholderStr: "")
        tableTool.tableTextAreaCell(table: table7, labelStr: "治疗药物以及\n剂量调整情况：")
        
        let submitBtn = UIButton()
        bgView.addSubview(submitBtn)
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.layer.cornerRadius = 5
        submitBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        submitBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(table7.snp.bottom).offset(10)
        }
        
    }
    
    
    
}
