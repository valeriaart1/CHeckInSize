//
//  Extension+UITextField.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 21.08.22.
//

import UIKit

enum CustomTextFieldType {
    
    case loginScreenTextField
    case namingTextFieldAlert
}

extension UITextField {
    static func makeTextField(
        with placeholder: String,
        fieldType type: CustomTextFieldType
    ) -> CustomTextField {
        let textField = CustomTextField(type: type, placeholder: placeholder)
        return textField
    }
}
