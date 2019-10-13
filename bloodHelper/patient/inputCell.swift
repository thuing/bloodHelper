//
//  inputCell.swift
//  bloodHelper
//
//  Created by 小福 on 2019/8/15.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms

class inputCell: FormBaseCell {
    
    //左侧图片视图
    @objc let titleLabel = UILabel()
    
    //右侧输入框
    @objc let textField  = UITextField()
    
    //初始化配置（只会在单元格创建完毕后调用一次）
    override func configure() {
        super.configure()
        
        //去除选中样式
        selectionStyle = .none
        
        //输入框文字样式
        textField.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1
        //输入框内容编辑响应时间
        textField.addTarget(self, action: #selector(inputCell.editingChanged(_:)),
                            for: .editingChanged)
        
        //将组件添加到视图中
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
    }
    
    //每次需要更新单元格是都会调用
    override func update() {
        super.update()
        
        titleLabel.text = rowDescriptor?.title
        
        //设置输入框文字
        textField.text = rowDescriptor?.value as? String
        textField.placeholder = rowDescriptor?.configuration.cell.placeholder
        textField.isSecureTextEntry = false
        textField.clearButtonMode = .whileEditing
    }
    
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //设置尺寸和位置
        titleLabel.frame = CGRect(x: 15, y: 10, width: 180, height: self.frame.height)
        textField.frame = CGRect(x: 200, y: 10, width: 150, height: 40)
    }
    
    override class func formRowCellHeight() -> CGFloat {
        return 60.0
    }
    
    //输入框内容编辑
    @objc internal func editingChanged(_ sender: UITextField) {
        guard let text = sender.text, text.count > 0
            else { rowDescriptor?.value = nil; update(); return }
        rowDescriptor?.value = text as AnyObject
    }


}
