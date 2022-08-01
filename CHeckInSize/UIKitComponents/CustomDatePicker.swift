//
//  CustomDatePicker.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 30.07.22.
//

import UIKit

// MARK: - CustomDatePicker

final class CustomDatePicker: UIDatePicker {
    
    // MARK: Initialization

    init() {
        super.init(frame: .zero)
        
        setAppearance()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: – Private Methods

extension CustomDatePicker {

    private func setAppearance() {
        self.datePickerMode = UIDatePicker.Mode.date
        self.contentHorizontalAlignment = .center
    }
}
