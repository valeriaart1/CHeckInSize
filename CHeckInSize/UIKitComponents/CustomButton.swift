//
//  CustomButton.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

// MARK: - CustomButton

final class CustomButton: UIButton {
    
    // MARK: Initialization

    init(
        type: CustomButtonType,
        title: String,
        contentAligment: ContentHorizontalAlignment
    ) {
        super.init(frame: .zero)
        setAppearance(
            type: type,
            title: title,
            contentAligment: contentAligment
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomButton {

    private func setAppearance(
        type: CustomButtonType,
        title: String,
        contentAligment: ContentHorizontalAlignment
    ) {
        
        switch type {
        case .blackButton(let cornerRadius, let backgroundColor, let titleColor, let size):
            self.setTitle(title, for: .normal)
            self.setTitleColor(titleColor.color, for: .normal)
            self.backgroundColor = backgroundColor.color
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = cornerRadius
            self.titleLabel?.sizeToFit()
            self.titleLabel?.font = UIFont(name: "Roboto", size: size)
            
        case .buttonWithNunitoBoldUnderline:
            let attrs = [
                NSAttributedString.Key.font : UIFont(name: "Nunito Sans Bold", size: 16.0)!,
                NSAttributedString.Key.foregroundColor : UIColor.black.cgColor,
                NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
            let buttonTitleStr = NSMutableAttributedString(string: title, attributes:attrs)
            self.setAttributedTitle(buttonTitleStr, for: .normal)
            self.contentHorizontalAlignment = contentAligment
            
        case .mainMenuButton(let color):
            self.setTitleColor(.black, for: .normal)
            self.setTitle(title, for: .normal)
            self.backgroundColor = color.color
            self.layer.cornerRadius = 14
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.titleLabel?.sizeToFit()
            self.titleLabel?.font = UIFont(name: "Roboto", size: 13.0)
            
        case .patternsButton(let text):
            self.setTitle(title, for: .normal)
            self.layer.cornerRadius = 20
            self.layer.backgroundColor = UIColor(hexString: "FFFFFF", alpha: 0.6).cgColor
        }
    }
}

