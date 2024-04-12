//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

final class StatsView: BaseInfoView {
    // MARK: Views
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Constants.Session.StatsView.stackSpacing
        view.distribution = .fillEqually
        return view
    }()
}

// MARK: Configuration
extension StatsView {
    func configure(with items: [StatsItemView.StatsItems]) {
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0.item)
            stackView.addArrangedSubview(itemView)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addViews(stackView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Session.StatsView.horizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Session.StatsView.horizontalPadding),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Session.StatsView.verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Session.StatsView.verticalPadding),
        ])
    }
    override func configureAppearance() { super.configureAppearance() }
}
