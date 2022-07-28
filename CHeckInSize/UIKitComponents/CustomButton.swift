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
        case .blackButton:
            self.setTitle(title, for: .normal)
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .black
            self.layer.cornerRadius = 20
            self.titleLabel?.sizeToFit()
            self.titleLabel?.font = UIFont(name: "Roboto", size: 15.0)
            
        case .buttonWithNunitoBoldUnderline:
            let attrs = [
                NSAttributedString.Key.font : UIFont(name: "Nunito Sans Bold", size: 16.0)!,
                NSAttributedString.Key.foregroundColor : UIColor.black.cgColor,
                NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
            let buttonTitleStr = NSMutableAttributedString(string: title, attributes:attrs)
            self.setAttributedTitle(buttonTitleStr, for: .normal)
            self.contentHorizontalAlignment = contentAligment
        }
    }
}

