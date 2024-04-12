//
//  SettingsController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class SettingsController: BaseController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: Configuration
extension SettingsController {
    override func setupViews() { super.setupViews() }
    override func setupConstraints() { super.setupConstraints() }
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.settings
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .settings)
    }
}
