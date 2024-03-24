//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
        configureControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods
private extension TabBarController {
    private func configureAppearance() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = Resources.Colors.navigationBackground
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = Constants.Common.borderWidth
        tabBar.layer.masksToBounds = true
    }
    
    private func configureControllers() {
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(
                title: tab.title,
                image: tab.image,
                tag: tab.rawValue
            )
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview: OverviewController()
        case .session: SessionController()
        case .progress: ProgressController()
        case .settings: SettingsController()
        }
    }
}
