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
    let bgview = UIView()
    //搜索控制器
    var countrySearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //配置搜索控制器
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = self as? UISearchBarDelegate  //两个样例使用不同的代理
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            
            return controller
        })()
        
        bgview.backgroundColor = UIColor.white
        view.addSubview(bgview)
        bgview.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(400)
            make.centerX.equalToSuperview()
        }
        
        gridViewController = UICollectionGridViewController()
        gridViewController.setColumns(columns: ["日期", "白细胞(WBC×10⁹)", "红细胞(RBC×10¹²)", "血红蛋白Hb(g/L)","红细胞比积HCT(%)","血小板(PLT×10⁹)","药物和剂量调整情况"])
        gridViewController.addRow(row: ["2018/10/10", "1.1", "1.8", "2.6","60%","2.6","剂量增加"])
        gridViewController.addRow(row: ["2018/11/01", "1.1", "1.2", "2.5","60%","2.5","剂量不变"])
        gridViewController.addRow(row: ["2018/12/16", "1.3", "1.5", "2.5","50%","2.4","剂量不变"])
        gridViewController.addRow(row: ["2019/01/10", "1.2", "1.6", "2.3","50%","2.3","剂量减少"])
        gridViewController.addRow(row: ["2019/02/24", "1.1", "1.2", "2.1","60%","2.0","剂量不变"])
        gridViewController.addRow(row: ["2019/03/15", "1.1", "1.2", "2.3","60%","1.9","剂量不变"])
        gridViewController.addRow(row: ["2019/04/11", "1.1", "1.2", "2.1","60%","1.9","剂量不变"])
        bgview.addSubview(gridViewController.view)
        
        setView()
        
    }
    
    func setView(){
    
        // 加入折线图
        let whtieCellBtn = UIButton()
        view.addSubview(whtieCellBtn)
        whtieCellBtn.setTitle("白细胞折线分析", for: .normal)
        whtieCellBtn.setImage(UIImage(named: "折线"), for: .normal)
        whtieCellBtn.layer.cornerRadius = 5
        whtieCellBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        whtieCellBtn.addTarget(self, action: #selector(jumpToWhiteChart), for: .touchUpInside)
        whtieCellBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(bgview.snp.bottom).offset(20)
        }
        
        let redCellBtn = UIButton()
        view.addSubview(redCellBtn)
        redCellBtn.setTitle("红细胞折线分析", for: .normal)
        redCellBtn.setImage(UIImage(named: "折线"), for: .normal)
        redCellBtn.layer.cornerRadius = 5
        redCellBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        redCellBtn.addTarget(self, action: #selector(jumpToRedChart), for: .touchUpInside)
        redCellBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(whtieCellBtn.snp.bottom).offset(5)
        }
        
        let HBBtn = UIButton()
        view.addSubview(HBBtn)
        HBBtn.setTitle("血红蛋白折线分析", for: .normal)
        HBBtn.setImage(UIImage(named: "折线"), for: .normal)
        HBBtn.layer.cornerRadius = 5
        HBBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        HBBtn.addTarget(self, action: #selector(jumpToHBChart), for: .touchUpInside)
        HBBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(redCellBtn.snp.bottom).offset(5)
        }
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRect(x:-10, y:88, width:view.frame.width,
                                               height:view.frame.height-60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }  

    // 跳转到白细胞图
    @objc func jumpToWhiteChart(){
        let pVC = whiteCellChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到红细胞图
    @objc func jumpToRedChart(){
        let pVC = redCellChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到血红蛋白图
    @objc func jumpToHBChart(){
        let pVC = HBChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    
}

