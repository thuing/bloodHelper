//
//  patientNoramlChartViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class patientNoramlChartViewController: UIViewController {

    var gridViewController: UICollectionGridViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["日期", "白细胞(WBC×10⁹)", "红细胞(RBC×10¹²)", "血红蛋白Hb(g/L)","红细胞比积HCT(%)","血小板(PLT×10⁹)","药物和剂量调整情况"])
        gridViewController.addRow(row: ["2018/10/10", "1.1", "1.8", "2.6","60%","2.6","剂量增加"])
        gridViewController.addRow(row: ["2018/11/01", "1.1", "1.2", "2.5","60%","2.5","剂量不变"])
        gridViewController.addRow(row: ["2018/12/16", "1.3", "1.5", "2.5","50%","2.4","剂量不变"])
        gridViewController.addRow(row: ["2019/01/10", "1.2", "1.6", "2.3","50%","2.3","剂量减少"])
        gridViewController.addRow(row: ["2019/02/24", "1.1", "1.2", "2.1","60%","2.0","剂量不变"])
        gridViewController.addRow(row: ["2019/03/15", "1.1", "1.2", "2.3","60%","1.9","剂量不变"])
        gridViewController.addRow(row: ["2019/04/11", "1.1", "1.2", "2.1","60%","1.9","剂量不变"])
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
