//
//  MonthlyPerformance.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    // MARK: Private properties
    private let chartsView = ChartsView()
    
    // MARK: Methods
    func configure(
        with items: [ChartsView.Data],
        interval: Int = 10,
        linesCount: Int = 9,
        chartTopOffset: CGFloat = 10
    ) {
        chartsView.configure(
            with: items,
            interval: interval,
            linesCount: linesCount,
            chartTopOffset: chartTopOffset
        )
    }
}

// MARK: Configuration
extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        
        addViews(chartsView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Progress.horizontalPadding),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Progress.horizontalPadding),
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Progress.horizontalPadding),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Progress.horizontalPadding),
        ])
    }
}
