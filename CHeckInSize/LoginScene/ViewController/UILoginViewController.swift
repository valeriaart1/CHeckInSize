//
//  UILoginViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit
import SnapKit

class UILoginViewController: UIViewController {
    
    private let uiLoginView: UILoginView
    
    var validationService: ValidationService
    var loginService: LoginService
    var firebaseServiceUserAccount: FirebaseServiceUserAccount
    var router: LoginSceneRouter
    
    init(
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        firebaseServiceUserAccount: FirebaseServiceUserAccount,
        uiLoginView: UILoginView
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.firebaseServiceUserAccount = firebaseServiceUserAccount
        self.router = router
        self.uiLoginView = uiLoginView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = uiLoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapScreen = UITapGestureRecognizer(target: self,
                                               action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    // MARK: Actions
    
    @objc
    private func dismissKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
