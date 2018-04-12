//
//  AppareilPhotoCell.swift
//  CodaGram
//
//  Created by christophe milliere on 10/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit
import AVFoundation

let CAMERA_CELL = "AppareilPhotoCell"

class AppareilPhotoCell: UICollectionViewCell {

    @IBOutlet weak var viewCamera: UIView!
    @IBOutlet weak var buttonFlash: UIButton!
    @IBOutlet weak var buttonRotation: UIButton!
    @IBOutlet weak var buttonPhoto: UIButton!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var captureOutput: AVCapturePhotoOutput?
    var position = AVCaptureDevice.Position.front
    var setting =  AVCapturePhotoSettings()
    var flashStatus = FlashStatus.off
    var controller: PhotoController?
    
    
    func addControllerDevice(controller: PhotoController){
        self.controller = controller
        self.buttonFlash.isHidden = true
        videoPreviewLayer?.removeFromSuperlayer()
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position){
            if device.hasFlash{
                buttonFlash.isHidden = false
            }
            do{
                let input = try AVCaptureDeviceInput(device: device)
                captureSession =  AVCaptureSession()
                if(captureSession?.canAddInput(input))!{
                    captureSession?.addInput(input)
                }
                
                captureOutput = AVCapturePhotoOutput()
                if (captureSession?.canAddOutput(captureOutput!))! {
                    captureSession?.addOutput(captureOutput!)
                }
                
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.videoGravity = .resizeAspectFill
                videoPreviewLayer?.frame = viewCamera.bounds
                viewCamera.layer.addSublayer(videoPreviewLayer!)
                
                captureSession?.startRunning()
                
            }catch{
                print( " erreur")
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func buttonFlashAction(_ sender: Any) {
    }
    
    @IBAction func butttonRotationAction(_ sender: Any) {
    }
    
    
    @IBAction func buttonPhotoAction(_ sender: Any) {
    }
    
}
