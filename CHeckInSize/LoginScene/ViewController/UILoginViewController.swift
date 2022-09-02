//
//  UILoginViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit
import SnapKit

class UILoginViewController: UIViewController {
    
    private let uikitTemplate = UIKitTemplate()
    
    var validationService: ValidationService
    var loginService: LoginService
    var firebaseServiceUserAccount: FirebaseServiceUserAccount
    var router: LoginSceneRouter
    lazy var logoImage: UIImageView = uikitTemplate.logoImage
    lazy var appName: UILabel = uikitTemplate.appNameForLogin

    init(
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        firebaseServiceUserAccount: FirebaseServiceUserAccount
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.firebaseServiceUserAccount = firebaseServiceUserAccount
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        constrainSubviews()
        
        view.layer.contents = uikitTemplate.backgroundImage.cgImage
        
        let tapScreen = UITapGestureRecognizer(target: self,
                                               action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    // MARK: Add views to the hierarchy
    
    func addSubviews() {
        [
            logoImage,
            appName
        ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        logoImage.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginLogoTopAnchor * self.view.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginLogoImageWidthAnchor * self.view.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
         }
        
        appName.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginLogoTopAnchor * self.view.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginAppNameWidthAnchor * self.view.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
         }
    }
    
    // MARK: Actions
    
    @objc
    private func dismissKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
