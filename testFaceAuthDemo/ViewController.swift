//
//  ViewController.swift
//  testFaceAuthDemo
//
//  Created by Gabriel Caldeira Martins on 16/06/23.
//

import UIKit
import FaceAuthenticator
import FaceLiveness

class ViewController: UIViewController {

    var faceAuth: FaceAuthSDK!
    
    var faceLiveness: FaceLivenessSDK!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnClick(_ sender: Any) {
        faceAuth = FaceAuthSDK.Builder()
            .setCredentials(token: "", personId: "")
            .setStage(stage: .PROD)
            .setFilter(filter: .natural)
            .build()
        
        faceAuth?.delegate = self
        
        faceAuth?.startFaceAuthSDK(viewController: self)
    }
    
    @IBAction func btnLivenessClick(_ sender: Any) {
        faceLiveness = FaceLivenessSDK.Build()
            .setCredentials(mobileToken: "", personId: "")
            .setStage(stage: .PROD)
            .setFilter(filter: .natural)
            .build()
        faceLiveness?.delegate = self
        
        faceLiveness?.startSDK(viewController: self)
    }
    
    
    
}

extension ViewController: FaceAuthSDKDelegate {
    func didFinishFaceAuth(with faceAuthenticatorResult: FaceAuthenticatorResult) {
        print(faceAuthenticatorResult)
    }
}

extension ViewController: FaceLivenessDelegate {
    func didFinishLiveness(with faceLivenesResult: FaceLivenessResult) {
        print(faceLivenesResult)
    }
    
    func startLoadingScreen() {
        print("StartLoadScreen")
    }
}
