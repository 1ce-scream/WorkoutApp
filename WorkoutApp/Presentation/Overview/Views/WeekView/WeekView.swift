//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 25.03.2024.
//

import UIKit

final class WeekView: BaseView {
    // MARK: Private properties
    private let calendar = Calendar.autoupdatingCurrent
    private let stackView = UIStackView()
    
    // MARK: Private methods
    private func setupWeekdaysStack() {
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        let sunday = weekdays.remove(at: 0)
        weekdays.append(sunday)
        
        weekdays.enumerated().forEach { index, weekday in
            let view = WeekDayView()
            view.configure(with: index, and: weekday)
            stackView.addArrangedSubview(view)
        }
    }
}

// MARK: Configuration
extension WeekView {
    override func setupViews() {
        super.setupViews()
        
        addViews(stackView)
        setupWeekdaysStack()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = Constants.OverviewNavBar.WeekView.weekStackSpacing
        stackView.distribution = .fillEqually
    }
}
