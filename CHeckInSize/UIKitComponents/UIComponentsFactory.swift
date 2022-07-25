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
    and action: Selector? = nil
    ) -> CustomButton {
        let button = CustomButton(type: type, title: title)

        if let action = action {
          button.addTarget(self, action: action, for: .touchUpInside)
        }
    return button
    }

    func makeTextField(
    with placeholder: String,
    fieldType type: CustomTextFieldType
    ) -> CustomTextField {
    let textField = CustomTextField(placeholder: placeholder)
    return textField
    }
    
    func makeLabel(
      with text: String,
      labelType type: CustomLabelType,
      size: Float?
    ) -> CustomLabel {
      let label = CustomLabel(type: type, text: text, size: size)
      return label
    }
}
