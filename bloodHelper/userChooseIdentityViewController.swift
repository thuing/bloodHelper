//
//  userChooseIdentityViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/24.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class userChooseIdentityViewController: UIViewController {

    @IBOutlet weak var patientBtn: UIButton!
    
    @IBOutlet weak var doctorBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    // 手势不可返回
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    func setView(){
    
        view.backgroundColor = UIColor.white
        
        patientBtn.setTitle("患者", for: .normal)
        patientBtn.layer.cornerRadius = 5
        patientBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        patientBtn.addTarget(self, action: #selector(patientBtnAction), for: .touchUpInside)
        patientBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.center.equalToSuperview()
        }
        
        
        // 医生身份
        doctorBtn.setTitle("医生", for: .normal)
        doctorBtn.layer.cornerRadius = 5
        doctorBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        doctorBtn.addTarget(self, action: #selector(doctorBtnAction), for: .touchUpInside)
        doctorBtn.snp.makeConstraints{(make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(patientBtn.snp.bottom).offset(20)
        }
        
    }

    
    @objc func patientBtnAction(){
        UserDefaults.standard.set("patient", forKey: UuserIdentity)
        print("用户选择了:",UserDefaults.standard.string(forKey: UuserIdentity) as Any)
    }
    
    @objc func doctorBtnAction(){
        UserDefaults.standard.set("doctor", forKey: UuserIdentity)
        print("用户选择了:",UserDefaults.standard.string(forKey: UuserIdentity) as Any)
    }
 
    
}
