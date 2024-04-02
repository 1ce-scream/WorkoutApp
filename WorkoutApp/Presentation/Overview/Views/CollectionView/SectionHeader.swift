//
//  SectionHeader.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 02.04.2024.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    static let id = "SectionHeader"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
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
    
    func configure(with date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        titleLabel.text = dateFormatter.string(from: date).uppercased()
    }
}

// MARK: Configuration
private extension SectionHeader {
    func setupViews() {
        addViews(titleLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    func configureAppearance() { }
}
