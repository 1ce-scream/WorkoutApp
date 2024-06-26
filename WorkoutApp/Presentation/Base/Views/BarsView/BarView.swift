//
//  BarView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 27.03.2024.
//

import UIKit

final class BarView: BaseView {
    // MARK: Private properties
    private let heightMuliplier: Double
    
    // MARK: Views
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.active
        view.layer.cornerRadius = Constants.BarView.cornerRadius
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.small)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    // MARK: Initializers
    init(item: BarItem) {
        self.heightMuliplier = item.heightMultiplier
        
        super.init(frame: .zero)
        
        titleLabel.text = item.title.uppercased()
        valueLabel.text = item.value
    }
    
    required init?(coder: NSCoder) {
        self.heightMuliplier = .zero
        super.init(frame: .zero)
    }
}

// MARK: Configuration
extension BarView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            valueLabel,
            barView,
            titleLabel
        )
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: Constants.BarView.barTopPadding),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: Constants.BarView.barWidth),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMuliplier * Constants.BarView.barMultiplier),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: Constants.BarView.titleBottomPadding)
        ])
    }
    
    override func configureAppearance() { super.configureAppearance() }
}

