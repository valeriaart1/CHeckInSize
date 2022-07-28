//
//  CustomAlert.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.07.22.
//

import UIKit

// MARK: - CustomAlert

final class CustomAlert: UIAlertController {
    
    // MARK: Initialization

    init(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style,
        alertType: CustomAlertType,
        cancelButtonText: String,
        agreementButtonText: String,
        textFieldPlaceholder: String
    ) {
        super.init(nibName: nil, bundle: nil)
        
        setAppearance(
            title: title,
            message: message,
            preferredStyle: preferredStyle,
            alertType: alertType,
            cancelButtonText: cancelButtonText,
            agreementButtonText: agreementButtonText,
            textFieldPlaceholder: textFieldPlaceholder
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomAlert {

    private func setAppearance(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style,
        alertType: CustomAlertType,
        cancelButtonText: String,
        agreementButtonText: String,
        textFieldPlaceholder: String
    ) {
        switch alertType {
        case .agreementAlert:
            self.title = title
            // Create cancel button with action handler
            let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
            // Create OK button with action handler
            let ok = UIAlertAction(title: agreementButtonText, style: .default, handler: nil)
            self.addAction(cancel)
            self.addAction(ok)
            
        case .disagreementAlert:
            self.title = title
            // Create cancel button with action handler
            let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
            // Create OK button with action handler
            let ok = UIAlertAction(title: agreementButtonText, style: .destructive, handler: nil)
            self.addAction(cancel)
            self.addAction(ok)
            
        case .agreementAlertWithTextField:
            self.title = title
            // Create cancel button with action handler
            let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
            // Create OK button with action handler
            let ok = UIAlertAction(title: agreementButtonText, style: .default, handler: nil)
            self.addTextField { (textField) in
                textField.placeholder = textFieldPlaceholder
                textField.clearButtonMode = .always
            }
            self.addAction(cancel)
            self.addAction(ok)
            
        case .errorAlert:
            self.title = title
            self.message = message
            self.view.layer.cornerRadius = 20
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "ОК", style: .default, handler: nil)
            ok.setValue(UIColor.black, forKey: "titleTextColor")
            self.addAction(ok)
        }
    }
}

