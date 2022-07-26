//
//  AlertFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

final class AlertFactory  {

    func showAlert(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style = .alert,
        alertType: CustomAlertType = .agreementAlert,
        cancelButtonText: String?,
        agreementButtonText: String?,
        textFieldPlaceholder: String?
    ) -> CustomAlert {
        let alert = CustomAlert(
            title: title,
            message: message,
            preferredStyle: preferredStyle,
            alertType: alertType,
            cancelButtonText: cancelButtonText,
            agreementButtonText: agreementButtonText,
            textFieldPlaceholder: textFieldPlaceholder
        )

        return alert
    }
    
    func showErrorAlert(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style = .alert
    ) -> CustomAlert {
        let alert = CustomAlert(
            title: title,
            message: message,
            preferredStyle: preferredStyle,
            alertType: .errorAlert,
            cancelButtonText: nil,
            agreementButtonText: nil,
            textFieldPlaceholder: nil
        )

        return alert
    }
}
