//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class SessionController: BaseController {
    // MARK: Private properties
    private let timerView: TimerView = TimerView()
    private let statsView: StatsView = StatsView(title: Resources.Strings.Session.workoutStats)
    private let stepsView: StepsView = StepsView(title: Resources.Strings.Session.stepsCounter)
    private let timerDuration: Double = MockData.shared.timerDuration
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        switch timerView.state {
        case .paused: 
            timerView.startTimer()
            timerView.state = .running
            setNavBarButtonTitle(Resources.Strings.NavBar.Buttons.sessionPause, at: .left)
        case .stopped:
            timerView.startTimer()
            timerView.state = .running
            setNavBarButtonTitle(Resources.Strings.NavBar.Buttons.sessionPause, at: .left)
        case .running:
            timerView.pauseTimer()
            timerView.state = .paused
            setNavBarButtonTitle(Resources.Strings.NavBar.Buttons.sessionStart, at: .left)
        }
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .stopped
        setNavBarButtonTitle(Resources.Strings.NavBar.Buttons.sessionStart, at: .left)
    }
    
    func timerButtonAction() {
        print("Timer button tapped")
    }
}

// MARK: Configuration
extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.addViews(
            timerView,
            statsView,
            stepsView
        )
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Session.horizontalPadding),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Session.horizontalPadding),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Session.verticalPadding),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Session.horizontalPadding),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: Constants.Session.statsVerticalPadding),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -(Constants.Session.horizontalPadding / 2)),
            
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Session.horizontalPadding),
            stepsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: Constants.Session.statsVerticalPadding),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: Constants.Session.horizontalPadding / 2),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, title: Resources.Strings.NavBar.Buttons.sessionStart)
        addNavBarButton(at: .right, title: Resources.Strings.NavBar.Buttons.sessionFinish)
        
        timerView.configureTimer(duration: timerDuration, progress: 0)
        timerView.onFinishTimerCallback = { [weak self] in
            guard let self = self else { return }
            let delay: Int = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
                self.navBarRightButtonHandler()
            }
        }
        
        statsView.configure(with: [
            .heartbeat(value: MockData.shared.heartRate),
            .avaragePace(value: MockData.shared.avarageDistance),
            .totalSteps(value: MockData.shared.totalSteps),
            .totalDistance(value: MockData.shared.totalDistance)
        ])
    }
}
