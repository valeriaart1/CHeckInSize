//
//  ViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 3.09.22.
//

import UIKit

public protocol ViewLoadable {
    
    associatedtype MainView: UIView
}
 
extension ViewLoadable where Self: UIViewController {
    /// The UIViewController's custom view.
    public var mainView: MainView {
        guard let customView = view as? MainView else {
            fatalError("Expected view to be of type \(MainView.self) but got \(type(of: view)) instead")
        }
        return customView
    }
}

internal class ViewController<ViewType: UIView>: UIViewController, ViewLoadable {
    
    public typealias MainView = ViewType
    
    open override func loadView() {
        let customView = MainView()
        view = customView
    }
}
