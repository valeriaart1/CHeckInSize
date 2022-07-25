//
//  CustomLabel.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 22.07.22.
//

import UIKit

final class CustomLabel: UILabel {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        type: CustomLabelType = .labelWithNunito,
        text: String = "",
        size: Float?
    ) {
        super.init(frame: .zero)
        switch type {
        case .labelWithNunito:
            self.text = text
            self.font = UIFont(name: "Nunito Sans", size: CGFloat(size ?? 15))
            self.textAlignment = .center
            self.lineBreakMode = .byWordWrapping
            self.numberOfLines = 0
            self.sizeToFit()
        case .labelWithNunitoBold:
            self.text = text
            self.font = UIFont(name: "Nunito Sans Bold", size: CGFloat(size ?? 22))
            self.textAlignment = .center
            self.sizeToFit()
        }
    }
}
