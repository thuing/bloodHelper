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
        label.numberOfLines = 2
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(140)
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
    
    
    // 含有是否单项选择的cell
    func tableChoosenCell(table:UIView,labelStr:String,trueStr:String,falseStr:String){
        
        let label = UILabel()
        table.addSubview(label)
        label.text = labelStr
        label.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        let trueBtn = UIButton(type: .custom)
        let falseBtn = UIButton(type: .custom)
        // 是否选择的按钮
        table.addSubview(falseBtn)
        falseBtn.setTitle(falseStr, for: .normal)
        falseBtn.setTitleColor(UIColor.black, for: .normal)
        falseBtn.setImage(UIImage(named: "unselected"), for: .normal)
        falseBtn.setImage(UIImage(named: "selected"), for: .selected)
        falseBtn.addTarget(self, action: #selector(self.falseAction(_:)), for: .touchUpInside)
        falseBtn.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(table.snp.right).offset(-50)
        }
        
        table.addSubview(trueBtn)
        trueBtn.setImage(UIImage(named: "unselected"), for: .normal)
        trueBtn.setImage(UIImage(named: "selected"), for: .selected)
        trueBtn.setTitle(trueStr, for: .normal)
        trueBtn.setTitleColor(UIColor.black, for: .normal)
        trueBtn.addTarget(self, action: #selector(self.trueAction(_:)), for: .touchUpInside)
        trueBtn.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(falseBtn.snp.left).offset(-30)
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
    
    
    @objc func trueAction(_ button: UIButton?) {
        button?.isSelected = true
//        if trueBtn.isSelected {
//        } else if !trueBtn.isSelected {
//            trueBtn.isSelected = true
//            falseBtn.isSelected = false
//        }
    }
//
//
    @objc func falseAction(_ button: UIButton?) {
        button?.isSelected = true
//        if falseBtn.isSelected {
//        } else if !falseBtn.isSelected {
//            falseBtn.isSelected = true
//            trueBtn.isSelected = false
//        }
    }

    
    
    
}
