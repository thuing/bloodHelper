//
//  patientChangedChartViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientChangedChartViewController: UIViewController {
    
    var gridViewController: UICollectionGridViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["开始治疗日期", "评估日期", "疲乏", "早饱感","腹部不适","活动力不佳","注意力不佳","夜间盗汗","皮肤瘙痒","骨痛","发热","体重下降","其他特殊症状体征"])
        gridViewController.addRow(row: ["2018/10/12", "2018/10/12", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2018/11/14", "2018/11/16", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2018/12/16", "2018/12/18", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2019/01/10", "2018/12/18", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2019/02/24", "2018/12/18", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2019/03/15", "2018/12/18", "有", "无","无","无","无","无","无","无","无","无","无"])
        gridViewController.addRow(row: ["2019/04/11", "2018/12/18", "有", "无","无","无","无","无","无","无","无","无","无"])
        view.addSubview(gridViewController.view)
        
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRect(x:-10, y:88, width:view.frame.width,
                                               height:view.frame.height-60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
