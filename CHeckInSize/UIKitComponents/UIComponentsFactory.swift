//
//  UIComponentsFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

final class UIComponentsFactory {

    func makeButton(
        with title: String,
        buttonType type: CustomButtonType,
        and action: UIAction? = nil,
        contentAligment: UIButton.ContentHorizontalAlignment?
    ) -> CustomButton {
        let button = CustomButton(type: type, title: title, contentAligment: contentAligment)
        if let action = action {
            button.addAction(action, for: .touchUpInside)
        }
        return button
    }

    func makeTextField(
        fieldType type: CustomTextFieldType,
        with placeholder: String = ""
    ) -> CustomTextField {
        let textField = CustomTextField(placeholder: placeholder)
        return textField
    }
    
    func makeLabel(
        labelType type: CustomLabelType,
        with text: String = "",
        size: Float = 200.0,
        textAligment: NSTextAlignment = .center
    ) -> CustomLabel {
        let label = CustomLabel(type: type, text: text, size: size, textAligment: textAligment)
        return label
    }
}
