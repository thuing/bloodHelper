//
//  UITableTool.swift
//  healthControl
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

class UITableTool: UIViewController{
    
    // 简单的样式列表
    func tableCell(table:UIView,labelStr:String,placeholderStr:String){
        
        let label = UILabel()
        table.addSubview(label)
        label.text = labelStr
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        let textfield = UITextField()
        table.addSubview(textfield)
        textfield.textAlignment = .center
        textfield.placeholder = placeholderStr
        textfield.layer.cornerRadius = 5
        textfield.layer.borderColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        textfield.layer.borderWidth = 1
        textfield.snp.makeConstraints{(make) in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalTo(label.snp.right).offset(10)
        }
        
        let line = UIView()
        line.layer.backgroundColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        table.addSubview(line)
        line.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(10)
        }
    }
    
    // 简单的样式列表，右对齐
    func tableRightCell(table:UIView,labelStr:String,placeholderStr:String){
        
        let label = UILabel()
        table.addSubview(label)
        label.text = labelStr
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        let textfield = UITextField()
        table.addSubview(textfield)
        textfield.textAlignment = .center
        textfield.placeholder = placeholderStr
        textfield.layer.cornerRadius = 5
        textfield.layer.borderColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        textfield.layer.borderWidth = 1
        textfield.snp.makeConstraints{(make) in
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(table.snp.right).offset(-40)
        }
        
        let line = UIView()
        line.layer.backgroundColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        table.addSubview(line)
        line.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(10)
        }
    }
    
    // 含有多行文本编辑的cell
    func tableTextAreaCell(table:UIView,labelStr:String){
        
        let label = UILabel()
        table.addSubview(label)
        label.text = labelStr
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        let textView = UITextView()
        table.addSubview(textView)
        textView.isEditable = true
        textView.isSelectable = true
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1
        textView.snp.makeConstraints{(make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.right.equalTo(table.snp.right).offset(-30)
        }
        
        let line = UIView()
        line.layer.backgroundColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        table.addSubview(line)
        line.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(10)
        }
    }
    
    // 带是否项的cell
    //    sinaButton = UIButton(type: .custom)
    //    sinaButton.frame = CGRect(x: 30, y: 200, width: 15, height: 15)
    //    sinaButton.setBackgroundImage(UIImage(named: "invest_delecte"), for: .normal)
    //    sinaButton.setBackgroundImage(UIImage(named: "invest_selecte"), for: .selected)
    //    sinaButton.addTarget(self, action: #selector(self.sinaAction(_:)), for: .touchUpInside)
    //    view.addSubview(sinaButton)
    
    func tableChoosenCell(table:UIView,labelStr:String){
        
        let label = UILabel()
        table.addSubview(label)
        label.text = labelStr
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        let textView = UITextView()
        table.addSubview(textView)
        textView.isEditable = true
        textView.isSelectable = true
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1
        textView.snp.makeConstraints{(make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.right.equalTo(table.snp.right).offset(-30)
        }
        
        let line = UIView()
        line.layer.backgroundColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0).cgColor
        table.addSubview(line)
        line.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(10)
        }
    }
    
    
    
    
    
    
}
