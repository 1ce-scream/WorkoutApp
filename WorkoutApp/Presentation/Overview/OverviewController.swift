//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class OverviewController: BaseController {
    // MARK: Private properties
    private let navBar = OverviewNavBar()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .overview)
        navBar.addAdditingAction(#selector(addButtonAction), with: self)
        navBar.addAllWorkoutsAction(#selector(allWorkoutsButtonAction), with: self)
    }
}

// MARK: Configuration
extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addViews(navBar)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: Button actions
@objc extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All Workouts button tapped")
    }
    
    func addButtonAction() {
        print("Add button tapped")
    }
}
