//
//  UILoginView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.08.22.
//

import UIKit
import SnapKit

class UILoginView: UIView {
    
    private let uikitTemplate = UIKitTemplate()
    lazy var logoImage: UIImageView = uikitTemplate.logoImage
    lazy var appName: UILabel = uikitTemplate.appNameForLogin

    init() {
        super.init(frame: .zero)
        
        addSubviews()
        constrainSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Add views to the hierarchy
    
    func addSubviews() {
        [
            logoImage,
            appName
        ].forEach {
            addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        logoImage.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginLogoTopAnchor * self.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginLogoImageWidthAnchor * self.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLogoHeightAnchor * self.frame.height)
         }
        
        appName.snp.makeConstraints { (make) -> Void in
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginLogoTopAnchor * self.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginAppNameWidthAnchor * self.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLogoHeightAnchor * self.frame.height)
         }
    }
}
