//
//  symptomDetailViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/10/14.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class symptomDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var symptomList: UICollectionView!
    var patientID: String = ""
    var select: Dictionary<String, JSON> = [:]
    var currentPosition = 0
    var symptom: Array<String> = []
    
    var symptomListArray: Array<Dictionary<String,JSON>> = [] as! Array<Dictionary>
    
    override func viewDidLoad() {
        super.viewDidLoad()

        symptomList.delegate = self
        symptomList.dataSource = self
        
        self.symptomList.backgroundColor = UIColor.clear
        showPatientList()
    }
    
    func showPatientList() {
        
        let loginUrl = xytURL + patientSymptom
        
        let doctorId = UserDefaults.standard.string(forKey: "doctorID")
        
        let bodyDic:Dictionary = ["doctor_id": doctorId ?? "","patient_id": patientID ]
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
                            self.symptomListArray.append(subJson.dictionaryValue)
                        }
                        //根据时间进行排序
                        self.symptomListArray = self.symptomListArray.sorted(by: { (array1, array2) -> Bool in
                            let obj1 = array1["evaluation_date"]?.stringValue
                            let obj2 = array2["evaluation_date"]?.stringValue
                            let dateFormater = DateFormatter()
                            dateFormater.dateFormat = "YYYY-MM-dd"
                            let date1 = dateFormater.date(from: obj1!)
                            let date2 = dateFormater.date(from: obj2!)
                            return date1?.compare(date2!) == .orderedAscending
                        })
                        
                        XYTPrint(self.symptomListArray)
                        self.currentPosition = self.symptomListArray.count - 1
                        self.updateSymptom()
                        self.timeLabel.text = self.symptomListArray[self.currentPosition]["evaluation_date"]?.stringValue
                        
                    }
                }
                    // 请求失败
                else{
                    XYTPrint("请求失败\(String(describing: response.error))")
                }
            }
        }
    }
    
    func updateSymptom(){
        
        self.select = self.symptomListArray[self.currentPosition]
        XYTPrint(self.currentPosition)
        for (key,value) in self.select{
            if value.stringValue == "1" {
                var symptomName = key
                switch symptomName {
                case "early_satiation":
                    symptomName = "早饱感"
                case "abdominal_discomfort":
                    symptomName = "腹部不适"
                case "poor_activity":
                    symptomName = "运动力不佳"
                case "poor_attention":
                    symptomName = "注意力不佳"
                case "night_sweet":
                    symptomName = "夜间盗汗"
                case "skin_itch":
                    symptomName = "皮肤瘙痒"
                case "bone_pain":
                    symptomName = "骨痛"
                case "fever":
                    symptomName = "腹部不适"
                case "weigh_loss":
                    symptomName = "体重下降"
                default:
                    symptomName = "default"
                }
                self.symptom.append(symptomName)
            }
        }
        
        XYTPrint(self.symptom)
        self.symptomList.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symptom.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "symptomDetailCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! symptomCell
        
        let symptomIcon = ["guke","neike","shuimian","tizhong","toubu","yundong","zhengxingke"]
        cell.symtomIcon.image = UIImage(named: symptomIcon[indexPath.item])
        cell.symotomLabel.text = symptom[indexPath.item]
        
        setShadow(view: cell.bgView, sColor: UIColor(red: 201.0 / 255.0, green: 201.0 / 255.0, blue: 201.0 / 255.0, alpha: 0.35), offset: CGSize(width: 5.0, height: 5.0), opacity: 1, radius: 5)
        
        return cell
    }
    
    
    @IBAction func previousAct(_ sender: Any) {
        if currentPosition != 0 {
            currentPosition = currentPosition - 1
            self.symptom.removeAll()
            self.timeLabel.text = symptomListArray[currentPosition]["evaluation_date"]?.stringValue
            updateSymptom()
            
        }
        
    }
    
    @IBAction func nextAct(_ sender: Any) {
        if currentPosition != symptomListArray.count - 1 {
            currentPosition = currentPosition + 1
            self.symptom.removeAll()
            self.timeLabel.text = symptomListArray[currentPosition]["evaluation_date"]?.stringValue ?? ""
            updateSymptom()
        }
    }
}
