//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class XAxisView: BaseView {
    // MARK: Views
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
}

// MARK: Configuration
extension XAxisView {
    func configure(with data: [ChartsView.Data]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        data.forEach {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.small)
            label.textColor = Resources.Colors.inactive
            label.text = $0.title.uppercased()
            
            stackView.addArrangedSubview(label)
        }
    }
    
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


