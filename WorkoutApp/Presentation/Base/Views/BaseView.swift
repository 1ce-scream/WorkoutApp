//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

class BaseView: UIView {
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}

// MARK: Configuration methods
@objc extension BaseView {
    func setupViews() {}
    func setupConstraints() {}
    func configureAppearance() {
        backgroundColor = Resources.Colors.navigationBackground
    }
}
