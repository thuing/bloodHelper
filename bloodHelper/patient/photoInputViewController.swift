//
//  photoInputViewController.swift
//  bloodHelper
//
//  Created by 小福 on 2019/5/9.
//  Copyright © 2019 小福. All rights reserved.
//

import UIKit
import AVFoundation
import WebKit

class photoInputViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    var session:AVCaptureSession!
    var screenWidth : CGFloat!
    var screenHeight:CGFloat!
    var jsonstr:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        //setView()
        setCamera()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        guard AVCaptureDevice.default(for: AVMediaType.video) != nil else{
            let alert = UIAlertController(title: "Error", message: "相机无法使用", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好", style: .cancel, handler: {
                _ in
                self.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .denied {
            hanldeAlertForAuthorization(isCamera: true)
        }
    }
    
    // 相机权限
    func hanldeAlertForAuthorization(isCamera: Bool){
        let alert = UIAlertController(title: "相机没有授权", message: "在[设置]中找到应用，开启[允许访问相机]", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "去设置", style: .cancel, handler: { _ in
            self.openSystemSettings()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func openSystemSettings(){
        let url = URL(string: UIApplicationOpenSettingsURLString)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    //设置除了扫描区以外的视图
    
    func setView(){
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth/2-100, height: screenHeight))
        leftView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.view.addSubview(leftView)
        
        let rightView = UIView(frame: CGRect(x: screenWidth/2+100, y: 0, width: screenWidth-(screenWidth/2+100), height: screenHeight))
        rightView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.view.addSubview(rightView)
        
        let topView = UIView(frame: CGRect(x: screenWidth/2-100, y: 0, width: 200, height: 100))
        topView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.view.addSubview(topView)
        
        let bottomView = UIView(frame: CGRect(x: screenWidth/2-100, y: 300, width: 200, height: screenHeight-300))
        bottomView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.view.addSubview(bottomView)
    }
    
    //设置相机
    
    func setCamera(){
        //获取摄像设备
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
            return
        }
        do {
            //创建输入流
            let input =  try AVCaptureDeviceInput(device: device)
            //创建输出流
            let output = AVCaptureMetadataOutput()
            //设置会话
            session = AVCaptureSession()
            //连接输入输出
            if session.canAddInput(input){
                session.addInput(input)
            }
            
            if session.canAddOutput(output){
                session.addOutput(output)
                //设置输出流代理，从接收端收到的所有元数据都会被传送到delegate方法，所有delegate方法均在queue中执行
                output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                //设置扫描二维码类型
                output.metadataObjectTypes = [ AVMetadataObject.ObjectType.qr]
                //扫描区域
                //rectOfInterest 属性中x和y互换，width和height互换。
                output.rectOfInterest = CGRect(x: 0, y: 0, width: screenHeight, height: screenWidth)
                
            }
            
            //捕捉图层
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = self.view.layer.bounds
            self.view.layer.insertSublayer(previewLayer, at: 0)
            
            //持续对焦
            if device.isFocusModeSupported(.continuousAutoFocus){
                try  input.device.lockForConfiguration()
                input.device.focusMode = .continuousAutoFocus
                input.device.unlockForConfiguration()
            }
            session.startRunning()
        } catch  {
        }
    }
    
    //扫描完成的代理
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        session?.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject
            let str = readableObject.stringValue!
            self.jsonstr = str
            if jsonstr?.count != 0 {
                print("扫描的字符串为：",jsonstr!)
                
                // 跳转去填写数据
                jumpToFillData()
            }else{
                session.startRunning()
            }
            
        }
    }
    
    func jumpToFillData(){
        let pVC = patientNormalInputViewController()
        pVC.jsonStr = self.jsonstr ?? ""
        self.navigationController?.pushViewController(pVC, animated: true)
    }
    
}
