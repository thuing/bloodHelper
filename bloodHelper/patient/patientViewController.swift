//
//  patientViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/4/23.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import SnapKit
import LLCycleScrollView

class patientViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    
    func setView(){
        
        // 轮播图
        let bannerView = LLCycleScrollView()
        let imagesURLStrings = [
            "医院1",
            "医院2",
            "医院3"
        ];
        bannerView.imagePaths = imagesURLStrings
        bannerView.coverImage = UIImage.init(named: "医院1")
        bannerView.autoScrollTimeInterval = 3.0
        bannerView.imageViewContentMode = .scaleAspectFit
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(300)
            make.top.equalTo(self.view).offset(-10)
            make.centerX.equalToSuperview()
        }
        
        // 背景view，四个btn
        let backView = UIView()
        view.addSubview(backView)
        backView.snp.makeConstraints{(make) in
            make.width.equalTo(330)
            make.height.equalTo(300)
            make.top.equalTo(bannerView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        // 血常规变化btn
        let normalbutton = UIButton()
        normalbutton.layer.cornerRadius = 12
        backView.addSubview(normalbutton)
        normalbutton.setTitle("血常规变化", for: .normal)
        normalbutton.setTitleColor(UIColor.white, for: .normal)
        normalbutton.backgroundColor = UIColor(red: 222.0 / 255.0, green: 177.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        normalbutton.setImage(UIImage(named: "normal"), for: .normal)
        calculateEdgeInsets(btn: normalbutton)
        normalbutton.addTarget(self, action: #selector(normalBtnClick(_:)), for: .touchUpInside)
        normalbutton.snp.makeConstraints{(make) in
            make.width.height.equalTo(150)
            make.left.equalToSuperview().offset(10)
        }
        
        // 治疗后症状btn
        let changebutton = UIButton()
        changebutton.layer.cornerRadius = 12
        backView.addSubview(changebutton)
        changebutton.setTitle("治疗后症状", for: .normal)
        changebutton.setTitleColor(UIColor.white, for: .normal)
        changebutton.backgroundColor = UIColor(red: 247.0 / 255.0, green: 231.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
        changebutton.setImage(UIImage(named: "change"), for: .normal)
        calculateEdgeInsets(btn: changebutton)
        changebutton.addTarget(self, action: #selector(changeBtnClick(_:)), for: .touchUpInside)
        changebutton.snp.makeConstraints{(make) in
            make.width.height.equalTo(150)
            make.right.equalToSuperview().offset(-10)
        }
        
        // 血常规变化图表
        let normalChangeChart = UIButton()
        normalChangeChart.layer.cornerRadius = 12
        backView.addSubview(normalChangeChart)
        normalChangeChart.setTitle("血常规变化图表", for: .normal)
        normalChangeChart.setTitleColor(UIColor.white, for: .normal)
        normalChangeChart.backgroundColor = UIColor(red: 105.0 / 255.0, green: 195.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
        normalChangeChart.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        normalChangeChart.snp.makeConstraints{(make) in
            make.width.height.equalTo(150)
            make.bottom.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        // 症状变化图表
        let SymptomChangeChart = UIButton()
        SymptomChangeChart.layer.cornerRadius = 12
        backView.addSubview(SymptomChangeChart)
        SymptomChangeChart.setTitle("症状变化图表", for: .normal)
        SymptomChangeChart.setTitleColor(UIColor.white, for: .normal)
        SymptomChangeChart.backgroundColor = UIColor(red: 154.0 / 255.0, green: 160.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
        SymptomChangeChart.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        SymptomChangeChart.snp.makeConstraints{(make) in
            make.width.height.equalTo(150)
            make.bottom.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
        }
        
    }
    
    // 图片文字上下排列，居中
    func calculateEdgeInsets(btn:UIButton) -> Void {
        let imageWidth = btn.imageView?.bounds.size.width
        let imageHeight = btn.imageView?.bounds.size.height
        let labelWidth: CGFloat = (btn.titleLabel?.intrinsicContentSize.width)!
        let labelHeight: CGFloat = (btn.titleLabel?.intrinsicContentSize.height)!
        
        let imageTitleSpace:CGFloat = 40.0;
        
        let imageEdgeInsets = UIEdgeInsets(top: -imageTitleSpace/2-labelHeight, left: 0, bottom: 0, right: -labelWidth)
        let labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight!-imageTitleSpace/2, right: 0)
        
        btn.titleEdgeInsets = labelEdgeInsets
        btn.imageEdgeInsets = imageEdgeInsets
    }
    
    
    @objc func buttonClick(_ button :UIButton) {
        
        let alertView = UIAlertController.init(title: "弹出框", message: "开始Swift的旅程吧", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "关闭", style: .default, handler: { (action) in
            print("点击关闭弹按钮")
        })
        let action1 = UIAlertAction.init(title: "确定", style: .default, handler: { (action) in
            print("点击确定按钮")
        })
        alertView.addAction(action)
        alertView.addAction(action1)
        self.present(alertView, animated: true, completion: {
        })
    }
    
    // 跳转到血常规变化填写页面
    @objc func normalBtnClick(_ button :UIButton) {
        let pVC = patientNormalChangeViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    // 跳转到治疗后症状填写页面
    @objc func changeBtnClick(_ button :UIButton) {
        let pVC = patientChangedViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
    
    
}
