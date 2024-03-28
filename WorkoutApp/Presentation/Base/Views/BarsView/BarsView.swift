//
//  BarsView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

final class BarsView: BaseView {
    // MARK: Private properties
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    // MARK: Methods
    func configure(with data: [BarView.BarItem]) {
        data.forEach {
            let barView = BarView(item: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}

// MARK: Configuration
extension BarsView {
    override func setupViews() {
        super.setupViews()
        
        addViews(stackView)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

