//
//  CustomImageView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 31.07.22.
//

import UIKit

// MARK: - CustomImageView

final class CustomImageView: UIImageView {
    
    // MARK: Initialization

    init(customImageViewType: CustomImageViewType,
        named: String) {
        super.init(frame: .zero)
        
        setAppearance(customImageViewType: customImageViewType,
                      named: named)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomImageView {

    private func setAppearance(
        customImageViewType: CustomImageViewType,
        named: String) {
            switch customImageViewType {
            case .iconImage:
                self.image = UIImage(named: named)
                self.layer.cornerRadius = 15
                self.contentMode = .scaleAspectFill
                self.layer.masksToBounds = true
                self.layer.borderWidth = 0.5
                self.layer.borderColor = UIColor.black.cgColor
            }
    }
}
