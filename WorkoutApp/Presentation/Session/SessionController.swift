//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class SessionController: BaseController {
    // MARK: Private properties
    private let timerView: BaseInfoView = TimerView()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, title: Resources.Strings.NavBar.Buttons.sessionLeft)
        addNavBarButton(at: .right, title: Resources.Strings.NavBar.Buttons.sessionRight)
        setupButtonActions()
    }
    
    // MARK: Private methods
    private func setupButtonActions() {
        timerView.addButtonAction(#selector(timerButtonAction), with: self)
    }
}

// MARK: Buttons actions
@objc extension SessionController {
    override func navBarLeftButtonHandler() {
        print("Session left navbar button tapped")
    }
    
    override func navBarRightButtonHandler() {
        print("Session right navbar button tapped")
    }
    
    func timerButtonAction() {
        print("Timer button tapped")
    }
}

// MARK: Configuration
extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.addViews(timerView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Session.horizontalPadding),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Session.horizontalPadding),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Session.verticalPadding),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
