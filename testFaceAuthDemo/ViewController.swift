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
    func didFinishSuccess(with faceAuthenticatorResult: FaceAuthenticator.FaceAuthenticatorResult) {
        print(faceAuthenticatorResult)
    }
    
    func didFinishWithError(with faceAuthenticatorErrorResult: FaceAuthenticator.FaceAuthenticatorErrorResult) {
        print(faceAuthenticatorErrorResult)
    }
    
    func didFinishWithCancell(with faceAuthenticatorResult: FaceAuthenticator.FaceAuthenticatorResult) {
        print(faceAuthenticatorResult)
    }
    
    func didFinishWithFail(with faceAuthenticatorResult: FaceAuthenticator.FaceAuthenticatorFailResult) {
        print(faceAuthenticatorResult)
    }
    
    
}

extension ViewController: FaceLivenessDelegate {
    func didFinishLiveness(with faceLivenessResult: FaceLiveness.FaceLivenessResult) {
        print(faceLivenessResult)
    }
    
    func didFinishWithFail(with faceLivenessFailResult: FaceLiveness.FaceLivenessFailResult) {
        print(faceLivenessFailResult)
    }
    
    func didFinishWithCancelled(with faceLivenessResult: FaceLiveness.FaceLivenessResult) {
        print(faceLivenessResult)
    }
    
    func didFinishWithError(with faceLivenessErrorResult: FaceLiveness.FaceLivenessErrorResult) {
        print(faceLivenessErrorResult)
    }
    
    func openLoadingScreenStartSDK() {
        print("open")
    }
    
    func closeLoadingScreenStartSDK() {
        print("close")
    }
    
    func openLoadingScreenValidation() {
        print("open")
    }
    
    func closeLoadingScreenValidation() {
        print("close")
    }
}
