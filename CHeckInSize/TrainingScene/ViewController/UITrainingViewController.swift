//
//  UITrainingViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 30.07.22.
//

import UIKit
import SnapKit

class UITrainingViewController: UIViewController {
    
    private let uikitTemplate = UIKitTemplate()
    
    var router: TrainingSceneRouter
    lazy var logoImage: UIImageView = uikitTemplate.logoImage
    lazy var appName: UILabel = uikitTemplate.appName
    private lazy var recordDate: UIDatePicker = UIDatePicker.makeDatePicker(and: dueDateChanged)
    lazy var menuBackground: UILabel = UILabel.makeLabel(labelType: .menuBackground, size: nil)
    private lazy var trainingButton: UIButton = UIButton.makeButton(with: "Тренировки", buttonType: .mainMenuButton(color: CustomColor.lightGreen.color), and: trainingButtonTapped, contentAligment: .center)
    private lazy var eatingButton: UIButton = UIButton.makeButton(with: "Питание", buttonType: .mainMenuButton(color: .white), and: eatingButtonTapped, contentAligment: .center)
    private lazy var measurementsButton: UIButton = UIButton.makeButton(with: "Замеры", buttonType: .mainMenuButton(color: .white), and: measurementsButtonTapped, contentAligment: .center)
    private lazy var statisticsButton: UIButton = UIButton.makeButton(with: "Статистика", buttonType: .mainMenuButton(color: .white), and: statisticsButtonTapped, contentAligment: .center)
    private lazy var accountIcon: UIImageView = UIImageView.makeImageView(imageViewType: .iconImage)

    init(
        router: TrainingSceneRouter
    ) {
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
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        logoImage.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLogoTopAnchor * self.view.frame.height)
            make.width.equalTo(TrainingConstantsAnchor.coeffLogoImageWidthAnchor * self.view.frame.width)
            make.height.equalTo(TrainingConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
         }
        
        appName.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffAppNameLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLogoTopAnchor * self.view.frame.height)
            make.width.equalTo(TrainingConstantsAnchor.coeffAppNameWidthAnchor * self.view.frame.width)
            make.height.equalTo(TrainingConstantsAnchor.coeffLogoHeightAnchor * self.view.frame.height)
         }
        
        recordDate.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffAppNameLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(TrainingConstantsAnchor.coeffRecordDateTopAnchor * self.view.frame.height)
            make.height.equalTo(TrainingConstantsAnchor.coeffRecordDateHeightAnchor * self.view.frame.height)
         }
        
        accountIcon.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(self.view).offset(-TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.centerY.equalTo(logoImage.snp.centerY)
            make.width.equalTo(TrainingConstantsAnchor.coeffUserIconWidthAnchor * self.view.frame.width)
            make.height.equalTo(TrainingConstantsAnchor.coeffUserIconHeightAnchor * self.view.frame.height)
         }
        
        menuBackground.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-TrainingConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(TrainingConstantsAnchor.coeffMenuBackgroundTopAnchor * self.view.frame.height)
            make.height.equalTo(TrainingConstantsAnchor.coeffMenuButtonHeightAnchor * self.view.frame.height)
         }
        
        trainingButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(menuBackground.snp.leading).offset(TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * self.view.frame.width)
            make.centerY.equalTo(menuBackground.snp.centerY)
            make.width.equalTo(TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * self.view.frame.width)
         }
        
        eatingButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(trainingButton.snp.trailing).offset(TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * self.view.frame.width)
            make.centerY.equalTo(menuBackground.snp.centerY)
            make.width.equalTo(TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * self.view.frame.width)
         }
        
        measurementsButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(eatingButton.snp.trailing).offset(TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * self.view.frame.width)
            make.centerY.equalTo(menuBackground.snp.centerY)
            make.width.equalTo(TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * self.view.frame.width)
         }
        
        statisticsButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(measurementsButton.snp.trailing).offset(TrainingConstantsAnchor.coeffMenuButtonTrailingAnchor * self.view.frame.width)
            make.centerY.equalTo(menuBackground.snp.centerY)
            make.width.equalTo(TrainingConstantsAnchor.coeffMenuButtonWidthAnchor * self.view.frame.width)
         }
    }
    
    private lazy var dueDateChanged = UIAction { [weak self] _ in
        print("")
    }
    
    private lazy var trainingButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = CustomColor.lightGreen.color
        self?.eatingButton.backgroundColor = .white
        self?.measurementsButton.backgroundColor = .white
        self?.statisticsButton.backgroundColor = .white
    }
    
    private lazy var eatingButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = .white
        self?.eatingButton.backgroundColor = CustomColor.lightGreen.color
        self?.measurementsButton.backgroundColor = .white
        self?.statisticsButton.backgroundColor = .white
    }
    
    private lazy var measurementsButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = .white
        self?.eatingButton.backgroundColor = .white
        self?.measurementsButton.backgroundColor = CustomColor.lightGreen.color
        self?.statisticsButton.backgroundColor = .white
    }
    
    private lazy var statisticsButtonTapped = UIAction { [weak self] _ in
        self?.trainingButton.backgroundColor = .white
        self?.eatingButton.backgroundColor = .white
        self?.measurementsButton.backgroundColor = .white
        self?.statisticsButton.backgroundColor = CustomColor.lightGreen.color
    }
}
