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
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}
