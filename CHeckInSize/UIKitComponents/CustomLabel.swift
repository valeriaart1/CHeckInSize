//
//  CustomLabel.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

// MARK: - CustomLabel

final class CustomLabel: UILabel {
    
    // MARK: Initialization

    init(
        type: CustomLabelType,
        text: String,
        size: Float?,
        textAligment: NSTextAlignment
    ) {
        super.init(frame: .zero)
        setAppearance(
            type: type,
            text: text,
            size: size,
            textAligment: textAligment
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomLabel {

    private func setAppearance(
        type: CustomLabelType,
        text: String,
        size: Float?,
        textAligment: NSTextAlignment
    ) {
        switch type {
        case .labelWithNunito:
            self.text = text
            self.font = UIFont(name: "Nunito Sans", size: CGFloat(size ?? 15))
            self.textAlignment = textAligment
            self.lineBreakMode = .byWordWrapping
            self.numberOfLines = 0
            self.sizeToFit()
            
        case .labelWithNunitoBold:
            self.text = text
            self.font = UIFont(name: "Nunito Sans Bold", size: CGFloat(size ?? 22))
            self.textAlignment = textAligment
            self.sizeToFit()
        }
    }
}


