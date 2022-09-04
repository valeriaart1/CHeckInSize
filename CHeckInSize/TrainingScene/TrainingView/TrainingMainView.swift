//
//  TrainingMainView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 4.09.22.
//

import UIKit
import SnapKit

class TrainingMainView: UITrainingViewController {
    
    private lazy var createNewTrainingButton: UIButton = UIButton.makeButton(with: "СОЗДАТЬ НОВУЮ ТРЕНИРОВКУ", buttonType: .blackButton(cornerRadius: 15, backgroundColor: .white, titleColor: .black, size: 13), and: createNewTrainingTapped)
    private lazy var createNewPatternButton: UIButton = UIButton.makeButton(with: "СОЗДАТЬ НОВЫЙ ШАБЛОН", buttonType: .blackButton(cornerRadius: 15, backgroundColor: .black, titleColor: .white, size: 13), and: createNewPatternTapped)
    private lazy var patternsLabel: UILabel = UILabel.makeLabel(with: "Шаблоны", labelType: .labelWithNunitoBold, size: nil)
//    private lazy var patternsButton: UIButton = uiComponentsFactory.makeButton(with: "Нажмите, чтобы добавить новый шаблон", buttonType: .patternsButton(type: nilButton, text: ""), and: patternsButtonTapped)

    typealias DI = ViewControllerFactory.TrainingDependency

    init(with container: DI) {
        super.init(
            router: container.router
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
    }
    
    // MARK: Add views to the hierarchy
    override func addSubviews() {
        super.addSubviews()
        
        [
            createNewTrainingButton,
            createNewPatternButton,
            patternsLabel//,
//            patternsButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        createNewTrainingButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(menuBackground.snp.bottom).offset(TrainingConstantsAnchor.coeffYTrailingAnchor * self.view.frame.height)
            make.height.equalTo(TrainingConstantsAnchor.coeffButtonHeightAnchor * self.view.frame.height)
         }
        
        createNewPatternButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(createNewTrainingButton.snp.bottom).offset(TrainingConstantsAnchor.coeffYTrailingAnchor * self.view.frame.height)
            make.height.equalTo(TrainingConstantsAnchor.coeffButtonHeightAnchor * self.view.frame.height)
         }
        
        patternsLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(createNewPatternButton.snp.bottom).offset(TrainingConstantsAnchor.coeffYTrailingAnchor * self.view.frame.height)
            make.width.equalTo(patternsLabel.snp.width)
            make.height.equalTo(TrainingConstantsAnchor.coeffButtonHeightAnchor * self.view.frame.height)
         }
    }

    // MARK: Actions
    
    private lazy var createNewTrainingTapped = UIAction { [weak self] _ in
    }
    
    private lazy var createNewPatternTapped = UIAction { [weak self] _ in
    }
    
    private lazy var patternsButtonTapped = UIAction { [weak self] _ in
    }
}
