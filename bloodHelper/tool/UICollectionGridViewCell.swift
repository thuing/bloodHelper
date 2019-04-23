//
//  UICollectionGridViewCell.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit

// 图表组件单元格类
class UICollectionGridViewCell: UICollectionViewCell {
    
    //内容标签
    var label:UILabel!
    
    //标签做边距
    var paddingLeft:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //单元格边框
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        //添加内容标签
        self.label = UILabel(frame: .zero)
        self.label.textAlignment = .center
        self.addSubview(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: paddingLeft, y: 0,
                             width: frame.width - paddingLeft,
                             height: frame.height)
    }
}
