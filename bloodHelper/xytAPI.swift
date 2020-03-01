//
//  xytAPI.swift
//  bloodHelper
//
//  Created by 小福 on 2019/9/26.
//  Copyright © 2019 小福. All rights reserved.
//

import Foundation
import UIKit

// 测试环境
//let xytURL = "http://127.0.0.1:8000/"

// 局域网
let xytURL = "http://192.168.31.117:9000/"

// 个人热点
//let xytURL = "http://172.20.10.2:8888/"

// 登录
let userSignIn = "users/login/"

// 注册
let userRegister = "users/register/"

// 患者个人信息填写
let patientData = "patient/data/"

// 医生个人信息填写
let doctorData = "doctor/data/"

// 患者血常规首次填写
let bloodFirst = "blood/first/"

// 患者血常规填写
let bloodSend = "blood/send/"

// 治疗后症状填写
let symptomData = "symptom/data/"

// 医生查看所有患者
let doctorPatients = "doctor/patients/"

// 医生查看患者个人信息
let doctorPatientData = "patient/patient_data/"

// 医生查看患者血常规数据
let doctorPatientBlood = "blood/data/"

// 医生查看患者治疗后症状数据
let patientSymptom = "symptom/patient_data/"

// 患者查看用药建议
let patientMedical = "medical/show/"

// 医生修改患者用药建议
let medicalSuggest = "medical/suggest/"



// MARK:- 自定义打印方法
func XYTPrint<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    
    print("\(fileName):(\(lineNum))-\(message)")
    
    #endif
    
}

// 字典转json
func getJSONStringFromDictionary(dictionary:NSDictionary) -> Data {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
    }
    
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)! as String
    let jsonData = JSONString.data(using: .utf8, allowLossyConversion: false)!
    return jsonData
    
}

func setShadow(view:UIView,sColor:UIColor,offset:CGSize,opacity:Float,radius:CGFloat) {
    //设置边框圆角
    view.layer.cornerRadius = radius
    //设置阴影颜色
    view.layer.shadowColor = sColor.cgColor
    //设置透明度
    view.layer.shadowOpacity = opacity
    //设置阴影半径
    view.layer.shadowRadius = radius
    //设置阴影偏移量
    view.layer.shadowOffset = offset
}


// 常量
// 用户身份
let UuserIdentity = "userIdentity"

// 登录状态
let userStatus = "userStatus"

// 医生编号
let doctorID = "doctorID"

// 患者编号
let patientID = "patientID"

// 前一次状态
let lastStatus = "lastStatus"
