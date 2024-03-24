//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

class BaseController: UIViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

// MARK: Methods
@objc extension BaseController {
    func setupView() {}
    func constraintViews() {}
    func configureAppearance() {
        view.backgroundColor = Resources.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: Resources.FontSizes.title)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
