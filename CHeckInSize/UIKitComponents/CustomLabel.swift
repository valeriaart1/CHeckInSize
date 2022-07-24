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
        text: String = ""
    ) {
        super.init(frame: .zero)
        switch type {
        case .labelWithNunito:
            self.text = text
            self.font = UIFont(name: "Nunito Sans", size: 16.0)
            self.sizeToFit()
        }
    }
}
