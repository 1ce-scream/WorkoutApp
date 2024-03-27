//
//  PercentView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        // MARK: Private properties
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = Constants.Session.Timer.percentViewStackSpacing
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.percentsTitle)
            label.textColor = Resources.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.percentsSubtitle)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            return label
        }()
    }
}

// MARK: Methods
extension TimerView.PercentView {
    func configure(with title: String, value: Int) {
        subtitleLabel.text = title.uppercased()
        percentLabel.text = "\(value)%"
    }
}

// MARK: Configuration
extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        
        addViews(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
