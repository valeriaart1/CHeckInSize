//
//  UILoginViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit

class UILoginViewController: UIViewController {
    
    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties
    
    var validationService: ValidationService
    var loginService: LoginService
    var alertFactory: AlertFactory
    var uiComponentsFactory: UIComponentsFactory
    var router: LoginSceneRouter
    lazy var logoImage: UIImageView = uikitTemplate.logoImage
    lazy var appName: UILabel = uikitTemplate.appName
    
    
    // MARK: Intialization

    init(
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        alertFactory: AlertFactory,
        uiComponentsFactory: UIComponentsFactory
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.alertFactory = alertFactory
        self.router = router
        self.uiComponentsFactory = uiComponentsFactory
        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
        
        view.layer.contents = uikitTemplate.backgroundImage.cgImage
    }
    
    // MARK: Add views to the hierarchy
    
    func addSubviews() {
        [
            logoImage,
            appName
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginLogoTopAnchor * view.frame.height),
            logoImage.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLogoImageWidthAnchor * view.frame.width),
            logoImage.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLogoHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginLogoTopAnchor * view.frame.height),
            appName.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginAppNameWidthAnchor * view.frame.width),
            appName.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLogoHeightAnchor * view.frame.height)
        ])
    }
    
    func updateOptionsViewController (
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        alertFactory: AlertFactory,
        uiComponentsFactory: UIComponentsFactory
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.alertFactory = alertFactory
        self.router = router
        self.uiComponentsFactory = uiComponentsFactory
    }
}
