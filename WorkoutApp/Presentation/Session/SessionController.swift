//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class SessionController: BaseController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, title: Resources.Strings.NavBar.Buttons.sessionLeft)
        addNavBarButton(at: .right, title: Resources.Strings.NavBar.Buttons.sessionRight)
    }
    
    // MARK: Methods
    override func navBarLeftButtonHandler() {
        print("Session left navbar button tapped")
    }
    
    override func navBarRightButtonHandler() {
        print("Session right navbar button tapped")
    }
}

