//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class OverviewController: BaseController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.overview
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .overview)
    }
}

