//
//  CustomAlert.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.07.22.
//

import UIKit



final class CustomAlert: UIAlertController {
    
    func configurationTextField(textField: UITextField!){
        if textField == nil {
            textField.text = "Filename"
        }
    }
    
    convenience init(
        title: String? = "",
        message: String? = "",
        preferredStyle: UIAlertController.Style,
        alertType: CustomAlertType,
        cancelButtonText: String? = "Отмена",
        agreementButtonText: String? = "",
        textFieldPlaceholder: String? = ""
    ){
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
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
            self.addAction(ok)
        }
    }
}
