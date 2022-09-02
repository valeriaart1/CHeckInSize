//
//  Extension+UIImageView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 21.08.22.
//

import UIKit

enum CustomImageViewType {
    
    case iconImage
}

extension UIImageView {
    static func makeImageView(
        imageViewType: CustomImageViewType,
        named: String = Constants.defaultUserIcon
    ) -> UIImageView {
        let imageView = CustomImageView(customImageViewType: imageViewType,
                                        named: named)
        return imageView
    }
}
