//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class NavBarController: UINavigationController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    // MARK: Private methods
    private func configureAppearance() {
        view.backgroundColor = Resources.Colors.navigationBackground
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGray,
            .font: Resources.Fonts.helveticaRegular(with: Constants.FontSizes.title)
        ]
        
        navigationBar.addBottomBorder(
            with: Resources.Colors.separator,
            height: Constants.Common.borderWidth
        )
    }
}
