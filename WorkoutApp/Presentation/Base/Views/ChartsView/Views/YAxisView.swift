//
//  YAxisView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class YAxisView: BaseView {
    // MARK: Private properties
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    // MARK: Methods
    func configure(with data: [ChartsView.Data], by interval: Int) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        (0..<interval).reversed().forEach {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.small)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0 * interval)"
            
            stackView.addArrangedSubview(label)
        }
    }
}

// MARK: Configuration
extension YAxisView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
           stackView
        )
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
