//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class SecondaryButton: UIButton {
    // MARK: Private properties
    private let label: UILabel = .init()
    private let iconView: UIImageView = .init()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func setTitle(_ title: String) {
        label.text = title
    }
}

// MARK: Configuration
private extension SecondaryButton {
    func setupViews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.SecondaryButton.trailing),
            iconView.heightAnchor.constraint(equalToConstant: Constants.SecondaryButton.iconHeight),
            iconView.widthAnchor.constraint(equalToConstant: Constants.SecondaryButton.iconWidth),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.SecondaryButton.leading),
        ])
    }
    
    func configureAppearance() {
        backgroundColor = Resources.Colors.secondary
        layer.cornerRadius = Constants.SecondaryButton.cornerRadius
        makeSystem(self)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.active
        label.textAlignment = .center
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.main)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = Resources.Images.Common.arrowDown
        iconView.tintColor = Resources.Colors.active
        
    }
}
