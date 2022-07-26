//
//  CustomButton.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

final class CustomButton: UIButton {    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        type: CustomButtonType = .buttonWithNunitoBoldUnderline,
        title: String = "",
        contentAligment: ContentHorizontalAlignment?
    ) {
        super.init(frame: .zero)
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
            self.contentHorizontalAlignment = contentAligment ?? .center
        }
    }
}
