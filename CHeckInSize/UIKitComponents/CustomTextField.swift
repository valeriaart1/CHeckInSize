//
//  CustomTextField.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

final class CustomTextField: UITextField {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        type: CustomTextFieldType = .loginScreenTextField,
        placeholder: String = ""
    ) {
        super.init(frame: .zero)
        switch type {
        case .loginScreenTextField:
            self.keyboardType = .namePhonePad
            self.placeholder = placeholder
            self.backgroundColor = UIColor(hexString: "#FFFFFF", alpha: 0.6)
            self.layer.cornerRadius = 20
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:15, height:10))
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = spacerView
              self.layer.borderColor = UIColor(hexString: "#000000", alpha: 0.9).cgColor
            self.layer.borderWidth = 1
            self.clearButtonMode = .always
        case .namingTextFieldAlert:
            self.keyboardType = .namePhonePad
            self.placeholder = placeholder
            self.backgroundColor = UIColor(hexString: "#FFFFFF", alpha: 0.6)
            self.layer.cornerRadius = 20
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:15, height:10))
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = spacerView
              self.layer.borderColor = UIColor(hexString: "#000000", alpha: 0.9).cgColor
            self.layer.borderWidth = 1
            self.clearButtonMode = .always
            
        }
    }
}