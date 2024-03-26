//
//  BaseButton.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class BaseButton: UIButton {
    // MARK: Private properties
    private var type: BaseButtonType = .primary
    private var title: String?
    private let label: UILabel = .init()
    private let iconView: UIImageView = .init()
    
    // MARK: Initializers
    init(type: BaseButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    // MARK: Methods
    func setTitle(_ title: String?) {
        label.text = title
    }
}

// MARK: Configuration
private extension BaseButton {
    func setupViews() {
        addViews(
            label,
            iconView
        )
    }
    
    func setupConstraints() {
        var horizontalOffset: CGFloat  {
            switch type {
            case .primary: .zero
            case .secondary: Constants.BaseButton.horizontalPadding * 2
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: Constants.BaseButton.iconHeight),
            iconView.widthAnchor.constraint(equalToConstant: Constants.BaseButton.iconWidth),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -Constants.BaseButton.horizontalPadding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset),
        ])
    }
    
    func configureAppearance() {
        switch type {
        case .primary:
            label.textColor = Resources.Colors.inactive
            iconView.tintColor = Resources.Colors.inactive
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        case .secondary:
            backgroundColor = Resources.Colors.secondary
            layer.cornerRadius = Constants.BaseButton.cornerRadius
            label.textColor = Resources.Colors.active
            label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.main)
            iconView.tintColor = Resources.Colors.active
        }
        
        label.textAlignment = .center
        label.text = title
        iconView.image = Resources.Images.Common.arrowDown
        makeSystem(self)
    }
}
