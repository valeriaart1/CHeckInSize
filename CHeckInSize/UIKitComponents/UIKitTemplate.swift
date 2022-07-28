//
//  UIKitTemplate.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 19.07.22.
//

import UIKit

final class UIKitTemplate {
    
    lazy var backgroundImage: UIImage = {
        return UIImage(named: Constants.backgroundImageName) ?? UIImage()
    }()
    
    lazy var logoImage: UIImageView = {
    let imageView = UIImageView (
        image: UIImage(named: Constants.logoImageName)
    )
    return imageView
    }()
    
    lazy var appName: UILabel = {
        let myString:String = "CHeckInSize"
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
          NSAttributedString.Key.strokeWidth : -4.0]
          as [NSAttributedString.Key : Any]
        
        let label = UILabel(frame: .zero)
        let myMutableString = NSMutableAttributedString(string: myString, attributes: strokeTextAttributes)
        label.attributedText = myMutableString
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white.cgColor, range: NSRange(location:2,length:3))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white.cgColor, range: NSRange(location:6,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white.cgColor, range: NSRange(location:8,length:3))
        myMutableString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Bubblegum Sans", size: 45.0)!, range: NSRange(location:0,length:myString.lengthOfBytes(using: .ascii)))
        label.attributedText = myMutableString
        label.textAlignment = .center
        return label
    }()
}
