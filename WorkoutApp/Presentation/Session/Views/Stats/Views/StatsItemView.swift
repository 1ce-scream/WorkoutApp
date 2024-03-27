//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

final class StatsItemView: BaseView {
    // MARK: Private properties
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.title)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.percentsSubtitle)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
}

// MARK: Configuration
extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            imageView,
            stackView
        )
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.Session.StatsView.imageWidth),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Constants.Session.StatsView.horizontalPadding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

// MARK: Methods
extension StatsItemView {
    func configure(with item: StatsItem) {
        imageView.image = item.image
        titleLabel.text = item.title.uppercased()
        valueLabel.text = item.value
    }
}
