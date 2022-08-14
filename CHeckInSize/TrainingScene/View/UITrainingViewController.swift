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
    lazy var menuBackground: UILabel = uiComponentsFactory.makeLabel(labelType: .menuBackground, size: nil)
    private lazy var trainingButton: UIButton = uiComponentsFactory.makeButton(with: "Тренировки", buttonType: .mainMenuButton(color: .lightGreen), and: trainingButtonTapped, contentAligment: .center)
    private lazy var eatingButton: UIButton = uiComponentsFactory.makeButton(with: "Питание", buttonType: .mainMenuButton(color: .white), and: eatingButtonTapped, contentAligment: .center)
    private lazy var measurementsButton: UIButton = uiComponentsFactory.makeButton(with: "Замеры", buttonType: .mainMenuButton(color: .white), and: measurementsButtonTapped, contentAligment: .center)
    private lazy var statisticsButton: UIButton = uiComponentsFactory.makeButton(with: "Статистика", buttonType: .mainMenuButton(color: .white), and: statisticsButtonTapped, contentAligment: .center)
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
            accountIcon,
            trainingButton,
            eatingButton,
            measurementsButton,
            statisticsButton
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
            accountIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            accountIcon.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            accountIcon.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffUserIconWidthAnchor * self.view.frame.width),
            accountIcon.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffUserIconHeightAnchor * self.view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            menuBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            menuBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            menuBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: TrainingConstantsAnchor.coeffMenuBackgroundTopAnchor * view.frame.height),
            menuBackground.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuBackgroundHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            trainingButton.leadingAnchor.constraint(equalTo: menuBackground.leadingAnchor, constant: TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * view.frame.width),
            trainingButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonHeightAnchor * view.frame.height),
            trainingButton.centerYAnchor.constraint(equalTo: menuBackground.centerYAnchor),
            trainingButton.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * view.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            eatingButton.leadingAnchor.constraint(equalTo: trainingButton.trailingAnchor, constant: TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * view.frame.width),
            eatingButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonHeightAnchor * view.frame.height),
            eatingButton.centerYAnchor.constraint(equalTo: menuBackground.centerYAnchor),
            eatingButton.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * view.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            measurementsButton.leadingAnchor.constraint(equalTo: eatingButton.trailingAnchor, constant: TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * view.frame.width),
            measurementsButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonHeightAnchor * view.frame.height),
            measurementsButton.centerYAnchor.constraint(equalTo: menuBackground.centerYAnchor),
            measurementsButton.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * view.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            statisticsButton.leadingAnchor.constraint(equalTo: measurementsButton.trailingAnchor, constant: TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * view.frame.width),
            statisticsButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonHeightAnchor * view.frame.height),
            statisticsButton.centerYAnchor.constraint(equalTo: menuBackground.centerYAnchor),
            statisticsButton.widthAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * view.frame.width)
        ])
    }
    
    private lazy var dueDateChanged = UIAction { [weak self] _ in
        print("")
    }
    
    private lazy var trainingButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = CustomColor.lightGreen.color
        self?.eatingButton.backgroundColor = CustomColor.white.color
        self?.measurementsButton.backgroundColor = CustomColor.white.color
        self?.statisticsButton.backgroundColor = CustomColor.white.color
    }
    
    private lazy var eatingButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = CustomColor.white.color
        self?.eatingButton.backgroundColor = CustomColor.lightGreen.color
        self?.measurementsButton.backgroundColor = CustomColor.white.color
        self?.statisticsButton.backgroundColor = CustomColor.white.color
    }
    
    private lazy var measurementsButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = CustomColor.white.color
        self?.eatingButton.backgroundColor = CustomColor.white.color
        self?.measurementsButton.backgroundColor = CustomColor.lightGreen.color
        self?.statisticsButton.backgroundColor = CustomColor.white.color
    }
    
    private lazy var statisticsButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = CustomColor.white.color
        self?.eatingButton.backgroundColor = CustomColor.white.color
        self?.measurementsButton.backgroundColor = CustomColor.white.color
        self?.statisticsButton.backgroundColor = CustomColor.lightGreen.color
    }
}
