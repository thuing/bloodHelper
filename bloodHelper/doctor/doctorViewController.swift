//
//  doctorViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class doctorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setView()
    }
    
    func setView() {
        
        // 患者血常规变化表格btn
        let patientChangedButton = UIButton()
        patientChangedButton.layer.cornerRadius = 12
        view.addSubview(patientChangedButton)
        patientChangedButton.setTitle("患者血常规变化表格", for: .normal)
        patientChangedButton.setTitleColor(UIColor.white, for: .normal)
        patientChangedButton.backgroundColor = UIColor(red: 124.0 / 255.0, green: 248.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
        patientChangedButton.addTarget(self, action: #selector(doctorNormalChart), for: .touchUpInside)
        patientChangedButton.snp.makeConstraints{(make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // 患者个人信息表格btn
        let patientPersonalButton = UIButton()
        patientPersonalButton.layer.cornerRadius = 12
        view.addSubview(patientPersonalButton)
        patientPersonalButton.setTitle("患者个人信息表格", for: .normal)
        patientPersonalButton.setTitleColor(UIColor.white, for: .normal)
        patientPersonalButton.backgroundColor = UIColor(red: 240.0 / 255.0, green: 174.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0)
        patientPersonalButton.addTarget(self, action: #selector(patientPersonalChart), for: .touchUpInside)
        patientPersonalButton.snp.makeConstraints{(make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.bottom.equalTo(patientChangedButton.snp.top).offset(-10)
            make.centerX.equalToSuperview()
        }
        
        // 患者治疗后症状表格btn
        let patientAfterButton = UIButton()
        patientAfterButton.layer.cornerRadius = 12
        view.addSubview(patientAfterButton)
        patientAfterButton.setTitle("患者治疗后症状表格", for: .normal)
        patientAfterButton.setTitleColor(UIColor.white, for: .normal)
        patientAfterButton.backgroundColor = UIColor(red: 154.0 / 255.0, green: 160.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
        patientAfterButton.addTarget(self, action: #selector(doctorChangedChart), for: .touchUpInside)
        patientAfterButton.snp.makeConstraints{(make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.top.equalTo(patientChangedButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    // 跳转到患者个人信息表格
    @objc func patientPersonalChart(){
        let pVC = patientPersonalChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到患者血常规变化表格
    @objc func doctorNormalChart(){
        let pVC = doctorNormalChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到患者治疗后症状表格
    @objc func doctorChangedChart(){
        let pVC = doctorChangedChartViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
}
