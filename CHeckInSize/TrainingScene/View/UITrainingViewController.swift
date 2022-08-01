//
//  UITrainingViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 30.07.22.
//

import UIKit

class UITrainingViewController: UIViewController {
    
    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties
    
    var alertFactory: AlertFactory
    var uiComponentsFactory: UIComponentsFactory
    var router: TrainingSceneRouter
    lazy var logoImage: UIImageView = uikitTemplate.logoImage
    lazy var appName: UILabel = uikitTemplate.appName
    private lazy var recordDate: UIDatePicker = uiComponentsFactory.makeDatePicker(and: dueDateChanged)
    private lazy var menuBackground: UILabel = uiComponentsFactory.makeLabel(labelType: .menuBackground, size: nil)
    private lazy var accountIcon: UIImageView = uiComponentsFactory.makeImageView(imageViewType: .iconImage)
    
    
    // MARK: Intialization

    init(
        router: TrainingSceneRouter,
        alertFactory: AlertFactory,
        uiComponentsFactory: UIComponentsFactory
    ) {
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
            appName,
            recordDate,
            menuBackground,
            accountIcon
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: TrainingConstantsAnchor.coeffLogoTopAnchor * self.view.frame.height),
            logoImage.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffLogoImageWidthAnchor * self.view.frame.width),
            logoImage.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            appName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: TrainingConstantsAnchor.coeffAppNameLeadingTrailingAnchor * self.view.frame.width),
            appName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: TrainingConstantsAnchor.coeffLogoTopAnchor * self.view.frame.height),
            appName.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffAppNameWidthAnchor * self.view.frame.width),
            appName.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            recordDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            recordDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            recordDate.topAnchor.constraint(equalTo: view.topAnchor, constant: TrainingConstantsAnchor.coeffRecordDateTopAnchor * view.frame.height),
            recordDate.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffRecordDateHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            menuBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            menuBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            menuBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: TrainingConstantsAnchor.coeffMenuBackgroundTopAnchor * view.frame.height),
            menuBackground.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuBackgroundHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            accountIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            accountIcon.topAnchor.constraint(equalTo: self.view.topAnchor, constant: TrainingConstantsAnchor.coeffLogoTopAnchor * self.view.frame.height),
            accountIcon.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffUserIconWidthAnchor * self.view.frame.width),
            accountIcon.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffUserIconHeightAnchor * self.view.frame.height)
        ])
    }
    
    private lazy var dueDateChanged = UIAction { [weak self] _ in
        print("")
    }
}
