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
    
    func setView(){
    
        view.backgroundColor = UIColor.white
        
        patientBtn.setTitle("患者", for: .normal)
        patientBtn.layer.cornerRadius = 5
        patientBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        
        // 医生身份
        doctorBtn.setTitle("医生", for: .normal)
        doctorBtn.layer.cornerRadius = 5
        doctorBtn.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "patientRegister"{
            let controller = segue.destination as! userSignUpViewController
            controller.userIdentity = "patient"
        }
        if segue.identifier == "doctorRegister"{
            let controller = segue.destination as! userSignUpViewController
            controller.userIdentity = "doctor"
        }
    }
}
