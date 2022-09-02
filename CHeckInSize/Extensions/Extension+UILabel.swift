//
//  Extension+UILabel.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 21.08.22.
//

import UIKit

enum CustomLabelType {
    
    case labelWithNunito
    case labelWithNunitoBold
    case dateFormat
    case menuBackground
}

extension UILabel {
    static func makeLabel(
        with text: String = "",
        labelType type: CustomLabelType,
        size: Float?,
        textAligment: NSTextAlignment = .center
    ) -> CustomLabel {
        let label = CustomLabel(type: type, text: text, size: size, textAligment: textAligment)
        return label
    }
}
