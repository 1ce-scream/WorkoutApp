//
//  ChartsView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class ChartsView: BaseView {
    // MARK: Private properties
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()
    
    // MARK: Methods
    func configure(
        with data: [ChartsView.Data],
        interval: Int,
        linesCount: Int,
        chartTopOffset: CGFloat
    ) {
        yAxisView.configure(with: data, by: interval)
        xAxisView.configure(with: data)
        chartView.configure(with: data, linesCount: linesCount, chartTopOffset: chartTopOffset)
    }
}

// MARK: Configuration
extension ChartsView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            yAxisView,
            xAxisView,
            chartView
        )
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -Constants.Charts.yAxisBottomPadding),
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Charts.xAxisTrailingPadding),
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: Constants.Charts.xAxisLeadingPadding),
            
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Charts.chartTopPadding),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Charts.chartTrailngPadding),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -Constants.Charts.chartBottomPadding),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: Constants.Charts.chartLeadingPadding),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

