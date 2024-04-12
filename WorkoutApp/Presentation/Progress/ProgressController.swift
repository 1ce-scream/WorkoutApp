//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class ProgressController: BaseController {
    // MARK: Views
    private let dailyPerformaceView = DailyPerformanceView(
        title: Resources.Strings.Progress.dailyPerformance,
        buttonTitle: Resources.Strings.Progress.last7days
    )
    
    private let monthlyPerformanceView = MonthlyPerformanceView(
        title: Resources.Strings.Progress.monthlyPerformance,
        buttonTitle: Resources.Strings.Progress.last10month
    )
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.alwaysBounceVertical = true
        return view
    }()
    
    private let scrollContent = UIView()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonActions()
    }
    
    // MARK: Private methods
    private func setupButtonActions() {
        dailyPerformaceView.addButtonAction(#selector(dailyPerformaceButtonAction), with: self)
        monthlyPerformanceView.addButtonAction(#selector(monthlyPerformaceButtonAction), with: self)
    }
}

// MARK: Buttons actions
@objc extension ProgressController {
    override func navBarLeftButtonHandler() {
        print("Progress left navbar button tapped")
    }
    
    override func navBarRightButtonHandler() {
        print("Progress right navbar button tapped")
    }
    
    func dailyPerformaceButtonAction() {
        print("Daily performance button tapped")
    }
    
    func monthlyPerformaceButtonAction() {
        print("Monthly performance button tapped")
    }
}

// MARK: Configuration
extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        view.addViews(scrollView)
        scrollView.addViews(scrollContent)
        scrollContent.addViews(
            dailyPerformaceView,
            monthlyPerformanceView
        )
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            dailyPerformaceView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: Constants.Progress.horizontalPadding),
            dailyPerformaceView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -Constants.Progress.horizontalPadding),
            dailyPerformaceView.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: Constants.Progress.verticalPadding),
            dailyPerformaceView.heightAnchor.constraint(equalTo: dailyPerformaceView.widthAnchor, multiplier: Constants.Progress.dailyPerformaceHeightMultiplier),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: Constants.Progress.horizontalPadding),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -Constants.Progress.horizontalPadding),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformaceView.bottomAnchor, constant: Constants.Progress.verticalPadding),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: Constants.Progress.monthlyPerformanceHeightMultiplier),
            monthlyPerformanceView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, title: Resources.Strings.NavBar.Buttons.progressLeft)
        addNavBarButton(at: .right, title: Resources.Strings.NavBar.Buttons.progressRight)
        
        dailyPerformaceView.configure(with: MockData.shared.dailyPerformanceItems)
        monthlyPerformanceView.configure(with: MockData.shared.monthlyPerformanceData)
    }
}
