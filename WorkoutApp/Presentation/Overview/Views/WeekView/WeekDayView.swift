//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 25.03.2024.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        // MARK: Views
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
    }
}

// MARK: Configuration
extension WeekView.WeekDayView {
    func configure(with index: Int, and name: String) {
        let startOfWeek = Date().startOfWeek
        let currentDay = startOfWeek.agoForward(to: index)
        let day = Date.calendar.component(.day, from: currentDay)
        let isToday = currentDay.stripTime() == Date().stripTime()
        
        backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
        nameLabel.text = name.uppercased()
        nameLabel.textColor = isToday ? Resources.Colors.navigationBackground : Resources.Colors.inactive
        dateLabel.text = "\(day)"
        dateLabel.textColor = isToday ? Resources.Colors.navigationBackground : Resources.Colors.inactive
    }
    
    override func setupViews() {
        super.setupViews()
        
        addViews(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = Constants.Common.cornerRadius
        layer.masksToBounds = true
        
        nameLabel.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.small)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.main)
        dateLabel.textAlignment = .center
        
        stackView.spacing = Constants.OverviewNavBar.WeekView.weekdayStackSpacing
        stackView.axis = .vertical
    }
}
