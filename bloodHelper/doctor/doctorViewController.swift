//
//  doctorViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

// 医生首页
class doctorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var patientListArray: Array<Dictionary<String,JSON>> = [] as! Array<Dictionary>
    let patientImg = ["user__easyico","icon-test","icon-test","icon-test","user__easyico","icon-test"]
    
    @IBOutlet weak var patientList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        showPatientList()
        patientList.delegate = self
        patientList.dataSource = self
        
        //去掉没有数据显示部分多余的分隔线
        patientList.tableFooterView =  UIView.init(frame: CGRect.zero)
    }
    
    
    func showPatientList() {
        
        let loginUrl = xytURL + doctorPatients
        
        UserDefaults.standard.set("A123", forKey: "doctorID")
        let doctorId = UserDefaults.standard.string(forKey: "doctorID")
        
        let bodyDic:Dictionary = ["doctor_id": doctorId ?? "" ]
        print(bodyDic)
        let jsonData = getJSONStringFromDictionary(dictionary: bodyDic as NSDictionary)
        
        let url = URL(string: loginUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON {
            (response) in
            
            // 请求成功
            if(response.error == nil){
                let jsonValue = response.result.value
                // 得到info
                if jsonValue != nil {
                    XYTPrint(jsonValue)
                    let json = JSON(jsonValue!)
                    let result = json["result"].stringValue
                    
                    if result == "success" {
                        
                        for (_,subJson):(String, JSON) in json["data"] {
                            self.patientListArray.append(subJson.dictionaryValue)
                        }
                        self.patientList.reloadData()
                    }
                }
                    // 请求失败
                else{
                    XYTPrint("请求失败\(String(describing: response.error))")
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return patientListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientListCell", for: indexPath) as! patientListCell
        let patient = patientListArray[indexPath.item]
        
        cell.patientImg.image = UIImage(named: patientImg[indexPath.row])
        cell.patientName.text = patient["patient_name"]?.string
        cell.patientId.text = patient["patient_id"]?.string
        cell.patientSex.text = patient["patient_gender"]?.string
        cell.patientAge.text = patient["patient_age"]?.stringValue
        
        setShadow(view: cell.bgview, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 跳转到详情页面
        let patientID = self.patientListArray[indexPath.item]["patient_id"]?.stringValue
        
        let pVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "patientDetailViewController")
            as? patientDetailViewController
        
        pVC?.patientID = patientID ?? ""
        pVC?.patientImg = UIImage(named: patientImg[indexPath.item])
        self.navigationController?.pushViewController(pVC!, animated: false)
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
