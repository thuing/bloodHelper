//
//  patientPersonalChartViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/24.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientPersonalChartViewController: UIViewController {

    var gridViewController: UICollectionGridViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["患者编号","姓名", "性别", "年龄", "联系电话"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        gridViewController.addRow(row: ["254215","lily", "女", "18", "12312345678"])
        view.addSubview(gridViewController.view)
        
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRect(x:-10, y:64, width:view.frame.width,
                                               height:view.frame.height-60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
