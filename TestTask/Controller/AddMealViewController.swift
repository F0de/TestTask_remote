//
//  ViewController.swift
//  TestTask
//
//  Created by Влад Тимчук on 12.06.2023.
//

import UIKit

//MARK: - AddMealViewController
class AddMealViewController: ViewController<AddMealView> {
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
    
}

open class ViewController<ViewType: UIView>: UIViewController, ViewLoadable {
    
    public typealias MainView = ViewType
    
    open override func loadView() {
        let customView = MainView()
        view = customView
    }
}

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
