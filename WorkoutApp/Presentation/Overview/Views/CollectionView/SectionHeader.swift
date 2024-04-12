//
//  SectionHeader.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 02.04.2024.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    // MARK: Static properties
    static let id = "SectionHeader"
    
    // MARK: Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
}

// MARK: Configuration
extension SectionHeader {
    func configure(with date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        titleLabel.text = dateFormatter.string(from: date).uppercased()
    }
    
    private func setupViews() {
        addViews(titleLabel)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    private func configureAppearance() { }
}
