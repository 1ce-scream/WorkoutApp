//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 25.03.2024.
//

import UIKit

final class OverviewNavBar: BaseView {
    // MARK: Private properties
    private let titleLabel = UILabel()
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    private let weekView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.2)
        return view
    }()
    
    // MARK: Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: Resources.Colors.separator, height: Constants.Common.borderWidth)
    }
    
    // MARK: Methods
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

// MARK: Configuration
extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            titleLabel,
            allWorkoutsButton,
            addButton,
            weekView
        )
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.OverviewNavBar.verticalPadding),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.OverviewNavBar.horizontalPadding),
            addButton.widthAnchor.constraint(equalToConstant: Constants.OverviewNavBar.addButtonHeight),
            addButton.heightAnchor.constraint(equalToConstant: Constants.OverviewNavBar.addButtonHeight),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -Constants.OverviewNavBar.horizontalPadding),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: Constants.SecondaryButton.height),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: Constants.SecondaryButton.width),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.OverviewNavBar.horizontalPadding),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: Constants.OverviewNavBar.weekViewVerticalPadding),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.OverviewNavBar.horizontalPadding),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.OverviewNavBar.horizontalPadding),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.OverviewNavBar.weekViewVerticalPadding),
            weekView.heightAnchor.constraint(equalToConstant: Constants.OverviewNavBar.weekViewHeight),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = Resources.Colors.navigationBackground
        
        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.header)
        
        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
        
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
    }
}
