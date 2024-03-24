//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class ProgressController: BaseController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, title: Resources.Strings.NavBar.Buttons.progressLeft)
        addNavBarButton(at: .right, title: Resources.Strings.NavBar.Buttons.progressRight)
    }
    
    // MARK: Methods
    override func navBarLeftButtonHandler() {
        print("Progress left navbar button tapped")
    }
    
    override func navBarRightButtonHandler() {
        print("Progress right navbar button tapped")
    }
}

