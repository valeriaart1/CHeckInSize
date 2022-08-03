//
//  CustomAlert.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.07.22.
//

import UIKit

// MARK: - CustomAlert

final class CustomAlert {
    
    static func showAlert (
         title: String,
         message: String,
         alertType: CustomAlertType,
         cancelButtonText: String,
         agreementButtonText: String,
         textFieldPlaceholder: String
     ) -> UIAlertController {
         let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
         switch alertType {
         case .agreementAlert:
             // Create cancel button with action handler
             let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
             // Create OK button with action handler
             let ok = UIAlertAction(title: agreementButtonText, style: .default, handler: nil)
             alert.addAction(cancel)
             alert.addAction(ok)
             
         case .disagreementAlert:
             // Create cancel button with action handler
             let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
             // Create OK button with action handler
             let ok = UIAlertAction(title: agreementButtonText, style: .destructive, handler: nil)
             alert.addAction(cancel)
             alert.addAction(ok)
             
         case .agreementAlertWithTextField:
             // Create cancel button with action handler
             let cancel = UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil)
             // Create OK button with action handler
             let ok = UIAlertAction(title: agreementButtonText, style: .default, handler: nil)
             alert.addTextField { (textField) in
                 textField.placeholder = textFieldPlaceholder
                 textField.clearButtonMode = .always
             }
             alert.addAction(cancel)
             alert.addAction(ok)
             
         case .errorAlert:
             alert.message = message
             alert.view.layer.cornerRadius = 20
             // Create OK button with action handler
             let ok = UIAlertAction(title: "ОК", style: .default, handler: nil)
             alert.addAction(ok)
         }
         return alert
     }
}
