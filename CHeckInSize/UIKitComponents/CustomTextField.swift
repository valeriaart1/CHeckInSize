//
//  CustomTextField.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

// MARK: - CustomTextField

final class CustomTextField: UITextField {

    // MARK: Initialization

    init(
        type: CustomTextFieldType,
        placeholder: String
    ) {
        super.init(frame: .zero)
        setAppearance(
            from: type,
            placeholder: placeholder
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomTextField {

    private func setAppearance(
        from type: CustomTextFieldType,
        placeholder: String
    ) {
        switch type {
        case .loginScreenTextField:
//            self.keyboardType = .namePhonePad
            self.placeholder = placeholder
            self.backgroundColor = .white
            self.layer.cornerRadius = 20
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:15, height:10))
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = spacerView
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.clearButtonMode = .always
        case .namingTextFieldAlert:
//            self.keyboardType = .namePhonePad
            self.placeholder = placeholder
            self.backgroundColor = .white
            self.layer.cornerRadius = 20
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:15, height:10))
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = spacerView
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.clearButtonMode = .always
        }
    }
}
