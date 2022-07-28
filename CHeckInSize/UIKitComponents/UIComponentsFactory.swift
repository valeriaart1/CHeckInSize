//
//  UIComponentsFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

enum CustomButtonType {

    case blackButton
    case buttonWithNunitoBoldUnderline
}

enum CustomTextFieldType {
    
    case loginScreenTextField
    case namingTextFieldAlert
}

enum CustomLabelType {
    
    case labelWithNunito
    case labelWithNunitoBold
}

final class UIComponentsFactory {

    func makeButton(
        with title: String,
        buttonType type: CustomButtonType,
        and action: UIAction, //уместен ли здесь опционал? по идее для всех кнопок должны быть прописаны какие-то действия, даже на этапе глубокой разработки можно создать пустую функцию
        contentAligment: UIButton.ContentHorizontalAlignment = .center
    ) -> CustomButton {
        let button = CustomButton(type: type, title: title, contentAligment: contentAligment)
        button.addAction(action, for: .touchUpInside)
        return button
    }

    func makeTextField(
        with placeholder: String,
        fieldType type: CustomTextFieldType
    ) -> CustomTextField {
        let textField = CustomTextField(type: type, placeholder: placeholder)
        return textField
    }
    
    func makeLabel(
        with text: String,
        labelType type: CustomLabelType,
        size: Float?,
        textAligment: NSTextAlignment = .center
    ) -> CustomLabel {
        let label = CustomLabel(type: type, text: text, size: size, textAligment: textAligment)
        return label
    }
}
