//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class OverviewController: BaseController {
    // MARK: Private properties
    private let allWorkoutsButton = SecondaryButton()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.overview
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .overview)
    }
}

// MARK: Configuration
extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(allWorkoutsButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: Constants.SecondaryButton.height),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: Constants.SecondaryButton.width),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
    }
}

@objc extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All Workouts button tapped")
    }
}
