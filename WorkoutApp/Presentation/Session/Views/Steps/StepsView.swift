//
//  StepsView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

final class StepsView: BaseInfoView {
    // MARK: Private properties
    private let barsView = BarsView()
    
    // MARK: Methods
    func configure(with items: [BarView.BarItem]) {
        barsView.configure(with: items)
    }
}

// MARK: Configuration
extension StepsView {
    override func setupViews() {
        super.setupViews()
        
        addViews(barsView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Bars.horizontalPadding),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Bars.horizontalPadding),
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Bars.verticalPadding),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Bars.verticalPadding),
        ])
    }
}
