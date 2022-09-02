//
//  Extension+UIDatePicker.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 21.08.22.
//

import UIKit

extension UIDatePicker {
    static func makeDatePicker(
        and action: UIAction?
    ) -> CustomDatePicker {
        let datePicker = CustomDatePicker()
        if let action = action {
            datePicker.addAction(action, for: UIControl.Event.valueChanged)
        }
        return datePicker
    }
}
