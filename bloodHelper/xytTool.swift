//
//  xytTool.swift
//  bloodHelper
//
//  Created by 小福 on 2019/9/27.
//  Copyright © 2019 小福. All rights reserved.
//

import Foundation
import UIKit

class xytTool:NSObject{
    
    // 弹框
    class func showAV(VC:UIViewController,title:String,message:String,clickOK:(() -> Swift.Void)? = nil,clickCancel:(() -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            if (clickCancel != nil){
                clickCancel!()
            }
        }
        let okAction = UIAlertAction(title: "好的", style: .default) { (action) in
            if (clickOK != nil){
                clickOK!()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        VC.present(alertController, animated: true, completion: nil)
    }
    
    

}
