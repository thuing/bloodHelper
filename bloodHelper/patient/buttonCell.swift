//
//  buttonCell.swift
//  bloodHelper
//
//  Created by 小福 on 2019/8/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SwiftForms

open class buttonCell: FormTitleCell {
    
    // MARK: FormBaseCell
    
    open override func configure() {
        super.configure()
        self.backgroundColor = UIColor.clear
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.backgroundColor = UIColor(red: 64.0 / 255.0, green: 224.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        titleLabel.clipsToBounds = true
    }
    
    open override func update() {
        super.update()
        titleLabel.text = rowDescriptor?.title
    }
}

