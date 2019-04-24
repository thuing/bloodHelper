//
//  doctorPersonalViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/24.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class doctorPersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView!
    
    var allItems:Array<String> = []
    var allItemsIcon:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据
        self.allItems = ["医生个人信息填写"]
        self.allItemsIcon = ["个人信息"]
        
        //创建表视图
        tableView = UITableView(frame:self.view.frame, style:.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //创建一个重用的单元格
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "doctorCell")
        view.addSubview(tableView)
        
        setView()
    }
    
    func setView(){
        
        // 背景view 医生身份图标
        let backView = UIView()
        view.addSubview(backView)
        backView.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        backView.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.top.equalTo(topLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        let patientIcon = UIImageView(image: UIImage(named: "医生身份"))
        patientIcon.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        backView.addSubview(patientIcon)
        patientIcon.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(10)
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(300)
            make.top.equalTo(backView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = self.allItems
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "doctorCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identify,for: indexPath as IndexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: allItemsIcon[indexPath.row])
        print(allItemsIcon[indexPath.row])
        cell.textLabel?.text = allItems[indexPath.row]
        
        return cell
    }
    
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath as IndexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            doctorInfo()
            break
        default:
            print("tableView 有误")
        }
    }
    
    // 跳转到医生个人信息填写
    func doctorInfo(){
        let pVC = doctorInfoViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    
}
