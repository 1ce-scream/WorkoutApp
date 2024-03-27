//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 25.03.2024.
//

import UIKit

class BaseInfoView: BaseView {
    // MARK: Properties
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.infoViewBackground
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = Constants.Common.borderWidth
        view.layer.cornerRadius = Constants.Common.cornerRadius
        return view
    }()
    
    // MARK: Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let button = BaseButton(type: .primary)
    
    // MARK: Initializers
    init(title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(buttonTitle?.uppercased())
        button.isHidden = buttonTitle == nil
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    // MARK: Methods
    func addButtonAction(_ action: Selector, with target: Any?) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}

// MARK: Configuration
extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            titleLabel,
            button,
            contentView
        )
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffset: CGFloat = titleLabel.text == nil ? .zero : Constants.BaseInfoView.titleOffset
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Constants.BaseInfoView.buttonHeight),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
