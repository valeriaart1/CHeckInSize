//
//  BackdropView.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 26.07.2022.
//

import UIKit

private struct _Constants {

    static let viewWidth: CGFloat = 381
    static let viewHeight: CGFloat = 81
}

// MARK: - BackdropView

class BackdropView: UIView {

    // MARK: Properties

    private lazy var backgroundImage: UIImage = {
        UIImage(
            named: Constants.backgroundImageName
        ) ?? UIImage()
    }()

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: Constants.logoImageName)
        )
        return imageView
    }()

    private lazy var appName: UILabel = {
        let rawString = "CHeckInSize"
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.strokeWidth : -4.0
        ] as [NSAttributedString.Key : Any]

        let label = UILabel(frame: .zero)
        let mutableString = NSMutableAttributedString(string: rawString, attributes: strokeTextAttributes)

        mutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.white.cgColor,
            range: NSRange(location:2,length:3)
        )
        mutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.white.cgColor,
            range: NSRange(location:6,length:1)
        )
        mutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.white.cgColor,
            range: NSRange(location:8,length:3)
        )
        mutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont(name: "Bubblegum Sans", size: 45.0)!,
            range: NSRange(location:0,length:rawString.lengthOfBytes(using: .ascii)
                          )
        )

        label.attributedText = mutableString
        label.textAlignment = .center

        return label
    }()

    // MARK: Initialization

    private init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        translatesAutoresizingMaskIntoConstraints = false
        layer.contents = backgroundImage.cgImage

        constrainSelf()
        addSubviews()
        constrainSubviews()
    }
}

// MARK: - Private Methods

extension BackdropView {

    private func constrainSelf() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: _Constants.viewHeight),
            widthAnchor.constraint(equalToConstant: _Constants.viewWidth),
        ])
    }

    private func addSubviews() {
        [logoImage, appName].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func constrainSubviews() {
        
    }
}
