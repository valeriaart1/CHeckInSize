//
//  TrainingMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit

class TrainingMainViewController: UITrainingViewController {

    // MARK: Properties
    private lazy var createNewTrainingButton: UIButton = uiComponentsFactory.makeButton(with: "СОЗДАТЬ НОВУЮ ТРЕНИРОВКУ", buttonType: .blackButton(cornerRadius: 15, backgroundColor: .white, titleColor: .black, size: 13), and: createNewTrainingTapped)
    private lazy var createNewPatternButton: UIButton = uiComponentsFactory.makeButton(with: "СОЗДАТЬ НОВЫЙ ШАБЛОН", buttonType: .blackButton(cornerRadius: 15, backgroundColor: .black, titleColor: .white, size: 13), and: createNewPatternTapped)
    private lazy var patternsLabel: UILabel = uiComponentsFactory.makeLabel(with: "Шаблоны", labelType: .labelWithNunitoBold, size: nil)
//    private lazy var patternsButton: UIButton = uiComponentsFactory.makeButton(with: "Нажмите, чтобы добавить новый шаблон", buttonType: .patternsButton(type: nilButton, text: ""), and: patternsButtonTapped)
    
    // MARK: Intialization

    typealias DI = ViewContorllerFactory.TrainingDependency

    init(with container: DI) {
        super.init(
            router: container.router,
            alertFactory: container.alertFactory,
            uiComponentsFactory: container.uiComponentsFactory
        )
    }

    // MARK: View Life Cycle

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
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        NSLayoutConstraint.activate([
            createNewTrainingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            createNewTrainingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            createNewTrainingButton.topAnchor.constraint(equalTo: menuBackground.bottomAnchor, constant: TrainingConstantsAnchor.coeffYTrailingAnchor * view.frame.height),
            createNewTrainingButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            createNewPatternButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            createNewPatternButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            createNewPatternButton.topAnchor.constraint(equalTo: createNewTrainingButton.bottomAnchor, constant: TrainingConstantsAnchor.coeffYTrailingAnchor * view.frame.height),
            createNewPatternButton.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            patternsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            patternsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TrainingConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            patternsLabel.topAnchor.constraint(equalTo: createNewPatternButton.bottomAnchor, constant: TrainingConstantsAnchor.coeffYTrailingAnchor * view.frame.height),
            patternsLabel.heightAnchor.constraint(equalToConstant: TrainingConstantsAnchor.coeffButtonHeightAnchor * view.frame.height),
            patternsLabel.widthAnchor.constraint(equalToConstant: patternsLabel.frame.width)
        ])
    }

    // MARK: Actions
    
    private lazy var createNewTrainingTapped = UIAction { [weak self] _ in
    }
    
    private lazy var createNewPatternTapped = UIAction { [weak self] _ in
    }
    
    private lazy var patternsButtonTapped = UIAction { [weak self] _ in
    }
}
