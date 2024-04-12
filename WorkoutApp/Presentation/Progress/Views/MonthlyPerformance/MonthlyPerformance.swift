//
//  MonthlyPerformance.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    // MARK: Views
    private let chartsView = ChartsView()
}

// MARK: Configuration
extension MonthlyPerformanceView {
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
    override func configureAppearance() { super.configureAppearance() }
}
