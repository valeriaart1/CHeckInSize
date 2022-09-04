//
//  Extension+UIButton.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 21.08.22.
//

import UIKit

enum CustomButtonType {

    case blackButton(cornerRadius: CGFloat, backgroundColor: UIColor, titleColor: UIColor, size: CGFloat)
    case buttonWithNunitoBoldUnderline
    case mainMenuButton(color: UIColor)
    case patternsButton
}

extension UIButton {
    static func makeButton(
        with title: String,
        buttonType type: CustomButtonType,
//        and action: UIAction,
        contentAligment: UIButton.ContentHorizontalAlignment = .center
    ) -> CustomButton {
        let button = CustomButton(type: type, title: title, contentAligment: contentAligment)
//        button.addAction(action, for: .touchUpInside)
        return button
    }
}
