//
//  TrainingMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit

class TrainingMainViewController: UITrainingViewController {

    // MARK: Properties
    
    
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
        
//        [
//        ].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
//
//        NSLayoutConstraint.activate([
//            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            codeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            codeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
//            codeTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
//        ])
//
//        NSLayoutConstraint.activate([
//            getNewCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            getNewCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            getNewCodeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height),
//            getNewCodeButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
//        ])
//
//        NSLayoutConstraint.activate([
//            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height),
//            confirmButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
//        ])
    }

    // MARK: Actions
    
//    private lazy var confirmButtonTapped = UIAction { [weak self] _ in
//        print("")
//    }
//
//    private lazy var getNewCodeTapped = UIAction { [weak self] _ in
//        print("")
//    }
}
